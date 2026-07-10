# LockBox

Cross-platform password manager (Windows and Linux) with an AES-256-GCM encrypted vault.
The master password is never stored: the encryption key is derived from it on the fly
with PBKDF2-SHA256 (600,000 iterations and a random salt).

## Run

Requires Python 3.10+ (on Linux, also the Tk package: `sudo pacman -S tk` on Arch,
`sudo apt install python3-tk` on Debian/Ubuntu).

- **Windows**: double-click `LockBox.bat`
- **Linux**: run `./lockbox.sh`

The first run creates a local virtual environment and installs the only dependency
(`cryptography`). After that it starts instantly.

## Vault location and syncing between machines

All entries live in a single encrypted file, `passwords.vault`. Its location is read
from a config file created on first run:

- Windows: `%APPDATA%\LockBox\config.json`
- Linux: `~/.config/lockbox/config.json`

To use the same passwords on two machines, sync the vault file with
[Syncthing](https://syncthing.net) (free, peer-to-peer, no cloud account) and point
`vault_path` on both machines to the synced copy:

```json
{ "vault_path": "/home/you/Sync/passwords.vault" }
```

```json
{ "vault_path": "C:/Users/you/Sync/passwords.vault" }
```

The vault is safe to sync or back up anywhere: without the master password its
contents cannot be decrypted.

## Features

- Password generator using the OS cryptographic random source
- Strength meter for every stored entry
- One-click copy with automatic clipboard clear after 2 seconds
- Search bar for quick lookup
- Lock button that wipes the session
