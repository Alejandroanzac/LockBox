#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

if ! python3 -c "import tkinter" 2>/dev/null; then
    echo "tkinter is missing. On Arch/CachyOS: sudo pacman -S tk"
    exit 1
fi

if [ ! -d .venv ]; then
    echo "First run: setting up environment..."
    python3 -m venv .venv
    .venv/bin/pip install --quiet cryptography
fi

exec .venv/bin/python lockbox.py
