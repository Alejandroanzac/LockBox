@echo off
cd /d "%~dp0"

py -3 --version >nul 2>nul
if errorlevel 1 (
    echo Python 3 is required. Install it from https://www.python.org/downloads/
    echo Make sure to check "Add python.exe to PATH" during installation.
    pause
    exit /b 1
)

if not exist .venv (
    echo First run: setting up environment...
    py -3 -m venv .venv
    .venv\Scripts\pip install --quiet cryptography
)

start "" .venv\Scripts\pythonw.exe lockbox.py
