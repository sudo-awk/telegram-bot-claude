# Multi-stage build for Claude Code Telegram Bot
FROM python:3.10-slim as builder

# Install Poetry
RUN pip install --no-cache-dir poetry

WORKDIR /app

# Copy all project files
COPY . .

# Configure Poetry to create venv in project directory
RUN poetry config virtualenvs.in-project true

# Install dependencies and the project
RUN poetry install --only main


FROM python:3.10-slim

# Install runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy everything from builder (includes .venv with all dependencies and installed project)
COPY --from=builder /app/.venv /app/.venv
COPY --from=builder /app/src /app/src
COPY --from=builder /app/pyproject.toml /app/poetry.lock /app/

# Set environment variables
ENV PATH="/app/.venv/bin:$PATH" \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Create a non-root user for security
RUN useradd -m -u 1000 botuser && \
    chown -R botuser:botuser /app

USER botuser

# Run the bot
CMD ["claude-telegram-bot"]
