{{- if eq .chezmoi.os "linux" -}}
#!/usr/bin/env bash
# This script runs **once** on macOS hosts.

set -euo pipefail

# 1. Ensure Homebrew exists
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"   # arm64 Macs
fi

echo "Updating Homebrew..."
brew update

echo "Installing CLI tools..."
brew install git micro moar lsd tealdeer thefuck bat zoxide mosh tmux curl wget
{{- end -}}
