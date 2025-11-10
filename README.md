# Claude Code Telegram Bot

This is a fork of [RichardAtCT/claude-code-telegram](https://github.com/RichardAtCT/claude-code-telegram). All credits to the original author.

## What is this?

A Telegram bot that lets you interact with Claude AI to get help with your code. You can chat with Claude, navigate your project files, and manage coding tasks directly from Telegram on any device.

## Quick Start

### Prerequisites

- Python 3.10 or higher
- Docker and Docker Compose (recommended)
- A Telegram bot token
- An Anthropic API key

### Option 1: Using Docker (Recommended)

1. Clone this repository:
```bash
git clone https://github.com/sudo-awk/telegram-bot-claude.git
cd telegram-bot-claude
```

2. Create a `.env` file with your credentials:
```bash
cp .env.example .env
```

3. Edit `.env` and add your credentials:
```bash
nano .env
```

4. Start the bot:
```bash
docker-compose up -d
```

5. Check if it's running:
```bash
docker-compose logs -f bot
```

### Option 2: Without Docker

1. Clone this repository:
```bash
git clone https://github.com/sudo-awk/telegram-bot-claude.git
cd telegram-bot-claude
```

2. Install Poetry:
```bash
curl -sSL https://install.python-poetry.org | python3 -
```

3. Install dependencies:
```bash
poetry install
```

4. Create a `.env` file:
```bash
cp .env.example .env
nano .env
```

5. Run the bot:
```bash
poetry run claude-telegram-bot
```

## Getting Your Credentials

### Telegram Bot Token

1. Open Telegram and search for "@BotFather"
2. Send `/newbot`
3. Follow the instructions and give your bot a name
4. Copy the token you receive (looks like: `123456789:ABCDEFGHIjklmno`)

### Anthropic API Key

1. Go to https://console.anthropic.com/
2. Sign in or create an account
3. Go to API keys section
4. Create a new API key
5. Copy it

### Your Telegram User ID

1. Open Telegram and search for "@userinfobot"
2. Send it any message
3. It will reply with your user ID (a number like: `123456789`)

## Configuration

Edit your `.env` file with these values:

```
TELEGRAM_BOT_TOKEN=your_bot_token_here
TELEGRAM_BOT_USERNAME=your_bot_username_here
ANTHROPIC_API_KEY=your_api_key_here
APPROVED_DIRECTORY=/path/to/your/projects
ALLOWED_USER_IDS=your_telegram_user_id
```

Replace the values with your actual credentials.

## Usage

Once running, open Telegram and find your bot by its username. Send it a message and it will respond.

Available commands:
- `/start` - Start the bot
- `/help` - Show help
- `/cd project_name` - Change to a project directory
- `/ls` - List files in current directory
- `/pwd` - Show current directory

Just type any question about your code and Claude will help.

## License

MIT License - See LICENSE file for details.
