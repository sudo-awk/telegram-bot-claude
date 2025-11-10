# Claude Code Telegram Bot 🤖

> 🍴 **This is a fork** of [RichardAtCT/claude-code-telegram](https://github.com/RichardAtCT/claude-code-telegram). All credits to the original author. This fork adds Docker support for easier deployment.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.9+](https://img.shields.io/badge/python-3.9+-blue.svg)](https://www.python.org/downloads/)

A powerful Telegram bot that provides remote access to [Claude Code](https://claude.ai/code), enabling developers to interact with their projects from anywhere. Transform your phone into a development terminal with full Claude AI assistance, project navigation, and session persistence.

## ✨ What is this?

This bot bridges Telegram and Claude Code, allowing you to:
- 💬 **Chat with Claude** about your code projects through Telegram
- 📁 **Navigate directories** and manage files remotely
- 🔄 **Maintain context** across conversations with session persistence
- 📱 **Code on the go** from any device with Telegram
- 🛡️ **Stay secure** with built-in authentication and sandboxing

Perfect for code reviews on mobile, quick fixes while traveling, or getting AI assistance when away from your development machine.

## 🚀 Quick Start

### Demo
```
You: cd my-project
Bot: 📂 Changed to: my-project/

You: ls
Bot: 📁 src/
     📁 tests/
     📄 README.md
     📄 package.json

You: Can you help me add error handling to src/api.py?
Bot: 🤖 I'll help you add robust error handling to your API...
     [Claude analyzes your code and suggests improvements]
```

## ✨ Features

### 🚧 Development Status

This project is actively being developed. Here's the current status of features:

#### ✅ **Working Features**
- Full Telegram bot functionality with advanced command handling
- Directory navigation (`cd`, `ls`, `pwd`) with project switching
- Multi-layer authentication (whitelist + optional token-based)
- Advanced rate limiting with token bucket algorithm
- Complete Claude integration with SDK/CLI support
- **✨ Enhanced file upload handling with archive extraction**
- **✨ Git integration with safe repository operations**
- **✨ Quick actions system with context-aware buttons**
- **✨ Session export in Markdown, HTML, and JSON formats**
- **✨ Image/screenshot upload with smart analysis prompts**
- **✨ Conversation enhancements with follow-up suggestions**
- SQLite database persistence with migrations
- Comprehensive usage and cost tracking
- Session management with persistence
- Audit logging and security event tracking

#### 🚀 **New Advanced Features**
- **📦 Archive Analysis**: Upload ZIP/TAR files for comprehensive project analysis
- **🔄 Git Operations**: View status, diffs, logs, and commit history
- **⚡ Quick Actions**: Context-aware buttons for tests, linting, formatting, etc.
- **📤 Session Export**: Download conversation history in multiple formats
- **🖼️ Image Support**: Upload screenshots and diagrams for analysis
- **💡 Smart Suggestions**: AI-powered follow-up action recommendations

#### 🔄 **Planned Enhancements**
- True streaming responses with real-time updates
- Claude vision API integration for full image analysis
- Custom quick actions configuration
- Advanced Git operations (when security permits)
- Plugin system for third-party extensions
- Multi-language code execution
- Webhook support for CI/CD integration

### 🤖 Claude AI Integration
- **Full Claude Code Access**: Complete integration with Claude's powerful coding assistant
- **Session Persistence**: Maintain conversation context with SQLite database storage
- **SDK & CLI Support**: Works with both Anthropic Python SDK and Claude CLI
- **Error Recovery**: Intelligent error handling with helpful suggestions and retry logic
- **Tool Support**: Access to Claude's full toolkit including file operations, code analysis, and more

### 📱 Terminal-like Interface
- **Directory Navigation**: `cd`, `ls`, `pwd` commands just like a real terminal
- **File Management**: Upload files, archives, and images for Claude to analyze
- **Git Integration**: View repository status, diffs, and commit history
- **Project Switching**: Easy navigation between different codebases with context preservation
- **Command History**: Full session tracking with export capabilities

### 🛡️ Enterprise-Grade Security
- **Multi-Layer Authentication**: Whitelist-based and optional token authentication
- **Directory Isolation**: Strict sandboxing to approved project directories
- **Rate Limiting**: Token bucket algorithm with request and cost-based limits
- **Comprehensive Audit Logging**: Complete tracking of all user actions and security events
- **Input Validation**: Protection against injection attacks, path traversal, and zip bombs

### ⚡ Developer Experience
- **Quick Actions**: Context-aware buttons for tests, linting, formatting, and more
- **Session Management**: Start, continue, end, export, and monitor Claude sessions
- **Usage Analytics**: Detailed cost tracking, usage patterns, and system statistics
- **Responsive Design**: Clean, mobile-friendly interface with inline keyboards
- **Smart Follow-ups**: AI-powered suggestions for next actions based on context

## 🛠️ Installation

### Prerequisites

- **Python 3.9+** - [Download here](https://www.python.org/downloads/)
- **Poetry** - Modern Python dependency management
- **Claude Code CLI** - [Install from here](https://claude.ai/code)
- **Telegram Bot Token** - Get one from [@BotFather](https://t.me/botfather)

### 1. Get Your Bot Token

1. Message [@BotFather](https://t.me/botfather) on Telegram
2. Send `/newbot` and follow the prompts
3. Save your bot token (it looks like `1234567890:ABC...`)
4. Note your bot username (e.g., `my_claude_bot`)

### 2. Set Up Claude Authentication

Choose one of these authentication methods:

**Option 1: Use existing Claude CLI login (Recommended)**
```bash
# Install Claude CLI
# Follow instructions at https://claude.ai/code

# Authenticate with Claude
claude

# follow the prompts to authenticate

# The bot will automatically use your CLI credentials
```

**Option 2: Use API key directly**
```bash
# Get your API key from https://console.anthropic.com/
# You'll add this to your .env file in the next step
```

### 3. Install the Bot

```bash
# Clone the repository
git clone https://github.com/yourusername/claude-code-telegram.git
cd claude-code-telegram

# Install Poetry (if needed)
curl -sSL https://install.python-poetry.org | python3 -

# Install dependencies
make dev
```

### 4. Configure Environment

```bash
# Copy the example configuration
cp .env.example .env

# Edit with your settings
nano .env
```

**Minimum required configuration:**
```bash
TELEGRAM_BOT_TOKEN=1234567890:ABC-DEF1234ghIkl-zyx57W2v1u123ew11
TELEGRAM_BOT_USERNAME=my_claude_bot
APPROVED_DIRECTORY=/Users/yourname/projects
ALLOWED_USERS=123456789  # Your Telegram user ID
```

### 5. Run the Bot

```bash
# Start in debug mode
make run-debug

# Or for production
make run
```

🎉 **That's it!** Message your bot on Telegram to get started.

> 📋 **Detailed Setup Guide**: For comprehensive setup instructions including authentication options and troubleshooting, see [docs/setup.md](docs/setup.md)

## 📱 Usage

### Basic Commands

Once your bot is running, you can use these commands in Telegram:

#### Navigation Commands
```
/ls                    # List files in current directory
/cd myproject         # Change to project directory
/pwd                  # Show current directory
/projects             # Show available projects
```

#### Session Management
```
/new                  # Start a new Claude session
/continue [message]   # Continue previous session (optionally with message)
/end                  # End current session
/status               # Show session status and usage
/export               # Export session (choose format: Markdown, HTML, JSON)
```

#### Advanced Features
```
/git                  # Show git repository info (status, diff, log)
/actions              # Show context-aware quick actions
```

#### Getting Help
```
/start                # Welcome message and setup
/help                 # Show all available commands
```

### Talking to Claude

Just send any message to interact with Claude about your code:

```
You: "Analyze this Python function for potential bugs"
You: "Help me optimize this database query"
You: "Create a React component for user authentication"
You: "Explain what this code does"
```

### File Operations

**Upload files:** Simply send files to Telegram and Claude will analyze them.

**Supported operations:**
- **Single files**: Code files, configs, documents - Claude analyzes content
- **Archives**: ZIP/TAR files - Extracts and analyzes project structure
- **Images**: Screenshots, diagrams, UI mockups - Smart prompt generation
- **Multiple files**: Send several files for batch analysis

**Supported file types:** `.py`, `.js`, `.ts`, `.jsx`, `.tsx`, `.java`, `.cpp`, `.c`, `.go`, `.rs`, `.rb`, `.php`, `.swift`, `.kt`, `.scala`, `.sql`, `.json`, `.xml`, `.html`, `.css`, `.md`, `.txt`, `.yaml`, `.toml`, `.zip`, `.tar`, `.tar.gz`, `.png`, `.jpg`, `.jpeg`, `.gif`, `.webp`, and more.

### Example Workflow

```
1. You: /cd my-web-app
   Bot: 📂 Changed to: my-web-app/

2. You: /ls
   Bot: 📁 src/
        📁 components/
        📄 package.json
        📄 README.md

3. You: "Can you help me add TypeScript to this project?"
   Bot: 🤖 I'll help you migrate to TypeScript! Let me analyze your project structure...
        [Claude provides detailed migration steps]

4. You: /status
   Bot: 📊 Session Status
        📂 Directory: my-web-app/
        🤖 Claude Session: ✅ Active
        💰 Usage: $0.15 / $10.00 (2%)
```

### Advanced Features Examples

#### 📦 Archive Analysis
```
You: [Upload project.zip]
Bot: 📦 Analyzing archive: project.zip

     Project Structure:
     📁 src/
       📄 main.py (2.3KB)
       📄 utils.py (1.1KB)
     📁 tests/
       📄 test_main.py (3.2KB)
     📄 requirements.txt (245B)

     Language: Python
     Frameworks: pytest detected
     Entry point: src/main.py

     🤖 I've analyzed your Python project. It appears to be...
```

#### 🔄 Git Integration
```
You: /git
Bot: 📊 Git Repository Status

     🌿 Branch: feature/new-api
     📝 Changes: 3 files modified
     🔄 Behind main: 2 commits

     Recent commits:
     • abc123 - Add API endpoint (2 hours ago)
     • def456 - Update dependencies (1 day ago)

     [View Diff] [Show Log] [See Changes]
```

#### ⚡ Quick Actions
```
You: /actions
Bot: 🚀 Available Quick Actions

     Based on your project context:
     [🧪 Run Tests] [📦 Install Deps]
     [🎨 Format Code] [🔍 Run Linter]
     [📝 Add Docs] [🔧 Refactor]
```

#### 📤 Session Export
```
You: /export
Bot: 📤 Export Session

     Choose format:
     [📝 Markdown] [🌐 HTML] [📋 JSON]

You: [Click Markdown]
Bot: ✅ Session exported!
     📎 claude_session_abc123.md (15.2KB)
     [Downloads as file in Telegram]
```

### Quick Actions

The bot provides helpful buttons for common tasks:

- 🧪 **Test** - Run your test suite
- 📦 **Install** - Install dependencies
- 🎨 **Format** - Format your code
- 🔍 **Find TODOs** - Locate TODO comments
- 🔨 **Build** - Build your project
- 📊 **Git Status** - Check git status

## ⚙️ Configuration

### Required Settings

```bash
# Telegram Bot Configuration
TELEGRAM_BOT_TOKEN=1234567890:ABC-DEF1234ghIkl-zyx57W2v1u123ew11
TELEGRAM_BOT_USERNAME=my_claude_bot

# Security - Base directory for project access (absolute path)
APPROVED_DIRECTORY=/Users/yourname/projects

# User Access Control
ALLOWED_USERS=123456789,987654321  # Your Telegram user ID(s)
```

### Common Optional Settings

```bash
# Claude Settings
CLAUDE_MAX_COST_PER_USER=10.0       # Max cost per user in USD
CLAUDE_TIMEOUT_SECONDS=300          # Timeout for operations
CLAUDE_ALLOWED_TOOLS="Read,Write,Edit,Bash,Glob,Grep,LS,Task,MultiEdit,NotebookRead,NotebookEdit,WebFetch,TodoRead,TodoWrite,WebSearch"

# Rate Limiting
RATE_LIMIT_REQUESTS=10              # Requests per window
RATE_LIMIT_WINDOW=60                # Window in seconds

# Features
ENABLE_GIT_INTEGRATION=true
ENABLE_FILE_UPLOADS=true
ENABLE_QUICK_ACTIONS=true

# Development
DEBUG=false
LOG_LEVEL=INFO
```

> 📋 **Full configuration reference:** See [`.env.example`](.env.example) for all available options with detailed descriptions.

### Finding Your Telegram User ID

To get your Telegram user ID for the `ALLOWED_USERS` setting:

1. Message [@userinfobot](https://t.me/userinfobot) on Telegram
2. It will reply with your user ID number
3. Add this number to your `ALLOWED_USERS` setting

## 🔧 Troubleshooting

### Common Issues

**Bot doesn't respond:**
- ✅ Check your `TELEGRAM_BOT_TOKEN` is correct
- ✅ Verify your user ID is in `ALLOWED_USERS`
- ✅ Ensure Claude Code CLI is installed and accessible
- ✅ Check bot logs for error messages

**"Permission denied" errors:**
- ✅ Verify `APPROVED_DIRECTORY` path exists and is readable
- ✅ Ensure the bot process has file system permissions
- ✅ Check that paths don't contain special characters

**Claude integration not working:**

*If using SDK mode (USE_SDK=true, which is default):*
- ✅ Check CLI authentication: `claude auth status`
- ✅ If no CLI auth, verify `ANTHROPIC_API_KEY` is set in .env
- ✅ Ensure API key has sufficient credits
- ✅ Check logs for "SDK initialization" messages

*If using CLI mode (USE_SDK=false):*
- ✅ Verify Claude CLI is installed: `claude --version`
- ✅ Check CLI authentication: `claude auth status`
- ✅ Ensure CLI has sufficient credits

*General troubleshooting:*
- ✅ Verify `CLAUDE_ALLOWED_TOOLS` includes necessary tools
- ✅ Check `CLAUDE_TIMEOUT_SECONDS` isn't too low
- ✅ Monitor usage with `/status` command

**High usage costs:**
- ✅ Adjust `CLAUDE_MAX_COST_PER_USER` to set spending limits
- ✅ Monitor usage with `/status` command
- ✅ Use shorter, more focused requests
- ✅ End sessions when done with `/end`

### Getting Help

- 📖 **Documentation**: Check this README and [`.env.example`](.env.example)
- 🐛 **Bug Reports**: [Open an issue](https://github.com/yourusername/claude-code-telegram/issues)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/yourusername/claude-code-telegram/discussions)
- 🔒 **Security**: See [SECURITY.md](SECURITY.md) for reporting security issues

## 🛡️ Security

This bot implements enterprise-grade security:

- **🔐 Access Control**: Whitelist-based user authentication
- **📁 Directory Isolation**: Strict sandboxing to approved directories
- **⏱️ Rate Limiting**: Request and cost-based limits prevent abuse
- **🛡️ Input Validation**: Protection against injection attacks
- **📊 Audit Logging**: Complete tracking of all user actions
- **🔒 Secure Defaults**: Principle of least privilege throughout

For security issues, see [SECURITY.md](SECURITY.md).

## 🤝 Contributing

We welcome contributions! Here's how to get started:

### Development Setup

```bash
# Fork and clone the repository
git clone https://github.com/yourusername/claude-code-telegram.git
cd claude-code-telegram

# Install development dependencies
make dev

# Run tests to verify setup
make test
```

### Development Commands

```bash
make help          # Show all available commands
make test          # Run tests with coverage
make lint          # Run code quality checks
make format        # Auto-format code
make run-debug     # Run bot in debug mode
```

### Contribution Guidelines

1. 🍴 **Fork** the repository
2. 🌿 **Create** a feature branch: `git checkout -b feature/amazing-feature`
3. ✨ **Make** your changes with tests
4. ✅ **Test** your changes: `make test && make lint`
5. 📝 **Commit** your changes: `git commit -m 'Add amazing feature'`
6. 🚀 **Push** to the branch: `git push origin feature/amazing-feature`
7. 🎯 **Submit** a Pull Request

### Code Standards

- **Python 3.9+** with type hints
- **Black** formatting (88 char line length)
- **pytest** for testing with >85% coverage
- **mypy** for static type checking
- **Conventional commits** for commit messages

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🌟 Star History

If you find this project useful, please consider giving it a star! ⭐

## 🙏 Acknowledgments

- **[RichardAtCT](https://github.com/RichardAtCT)** - Original creator of this amazing project
- [Claude](https://claude.ai) by Anthropic for the amazing AI capabilities
- [python-telegram-bot](https://github.com/python-telegram-bot/python-telegram-bot) for the excellent Telegram integration
- All contributors who help make this project better

### Fork Changes
- Added Docker support with `Dockerfile` and `docker-compose.yml` for easier deployment
- Added `.env.example` template for configuration management
- Added `.dockerignore` for optimized Docker builds
- Original project: [RichardAtCT/claude-code-telegram](https://github.com/RichardAtCT/claude-code-telegram)

---

**Made with ❤️ for developers who code on the go**
