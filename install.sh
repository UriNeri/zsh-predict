#!/bin/bash

PLUGIN_NAME="zsh-predict"
REPO_URL="https://github.com/urineri/zsh-predict"

# Determine ZSH_CUSTOM path
if [ -z "$ZSH_CUSTOM" ]; then
    ZSH_CUSTOM="$HOME/.oh-my-zsh"
fi

PLUGIN_DIR="$ZSH_CUSTOM/plugins/$PLUGIN_NAME"

# Create plugins directory if it doesn't exist
mkdir -p "$ZSH_CUSTOM/plugins"

# Clone or update the repo
if [ -d "$PLUGIN_DIR" ]; then
    git -C "$PLUGIN_DIR" pull origin master
else
    git clone "$REPO_URL" "$PLUGIN_DIR"
fi

# Add plugin to .zshrc if not already there
if ! grep -q "plugins=.*$PLUGIN_NAME" "$HOME/.zshrc"; then
    if grep -q "^plugins=(" "$HOME/.zshrc"; then
        sed -i.bak "s/^plugins=(/plugins=(\n $PLUGIN_NAME /" "$HOME/.zshrc"
    else
        echo "plugins=($PLUGIN_NAME)" >> "$HOME/.zshrc"
    fi
fi

# Interactive configuration - redirect from /dev/tty for piped scripts
echo "=== Configuration ==="
echo "Enter configuration values (press Enter for defaults):"

read -p "OpenAI API Key: " API_KEY </dev/tty
read -p "OpenAI API URL (default: https://api.openai.com/v1): " API_URL </dev/tty
read -p "Model (default: gpt-3.5-turbo): " MODEL </dev/tty
read -p "Max tokens (default: 1000): " MAX_TOKENS </dev/tty
# read -p "Temperature (default: 0.3): " TEMPERATURE

# Set defaults
API_URL=${API_URL:-https://api.openai.com/v1}
MODEL=${MODEL:-gpt-3.5-turbo}
MAX_TOKENS=${MAX_TOKENS:-1000}
# TEMPERATURE=${TEMPERATURE:-0.3}

# Create .env file
cat > "$PLUGIN_DIR/.env" << EOF
ZSH_PREDICT_API_KEY=$API_KEY
ZSH_PREDICT_API_URL=$API_URL
ZSH_PREDICT_MODEL=$MODEL
ZSH_PREDICT_TOKENS=$MAX_TOKENS
ZSH_PREDICT_SHORTCUT_PREDICT="^T"
EOF

echo "Configuration saved to $PLUGIN_DIR/.env"
echo "Restart your terminal or run: source ~/.zshrc"