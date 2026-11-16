#!/usr/bin/env bash
set -euo pipefail

# OpenCode UNLIMITED installer/updater (Termux + proot Ubuntu)
# Usage: curl -fsSL https://raw.githubusercontent.com/Inkflow-Gab/NullCode/main/opencode-unlimited/install.sh | bash

BASE_URL="${NULLCODE_UNLIMITED_BASE_URL:-https://raw.githubusercontent.com/Inkflow-Gab/NullCode/main/opencode-unlimited}"
BASE_DIR="${HOME}/.opencode-proxy"
LOCAL_BIN="${HOME}/.local/bin"
mkdir -p "$BASE_DIR" "$LOCAL_BIN"

fetch() {
  local src="$1" dst="$2"
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$src" -o "$dst"
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "$dst" "$src"
  else
    echo "curl or wget is required" >&2
    exit 1
  fi
}

SCRIPT_DIR=""
if [ -n "${BASH_SOURCE[0]:-}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
fi

if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/setup.py" ]; then
  echo "Installing from local folder: $SCRIPT_DIR"
  cp "$SCRIPT_DIR/setup.py" "$BASE_DIR/setup.py"
  for f in opencode-unlimited opencode; do
    [ -f "$SCRIPT_DIR/$f" ] && cp "$SCRIPT_DIR/$f" "$LOCAL_BIN/$f" && chmod +x "$LOCAL_BIN/$f" || true
  done
  [ -f "$SCRIPT_DIR/install.sh" ] && cp "$SCRIPT_DIR/install.sh" "$BASE_DIR/install.sh" || true
else
  echo "Downloading OpenCode UNLIMITED from $BASE_URL"
  fetch "$BASE_URL/setup.py" "$BASE_DIR/setup.py"
  fetch "$BASE_URL/opencode-unlimited" "$LOCAL_BIN/opencode-unlimited"
  fetch "$BASE_URL/opencode" "$LOCAL_BIN/opencode" || true
  fetch "$BASE_URL/install.sh" "$BASE_DIR/install.sh" || true
fi

chmod +x "$BASE_DIR/setup.py" "$LOCAL_BIN/opencode-unlimited" "$LOCAL_BIN/opencode" "$BASE_DIR/install.sh" 2>/dev/null || true
python3 "$BASE_DIR/setup.py" install

echo
echo "Done. Run: opencode-unlimited"
