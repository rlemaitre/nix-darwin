#GPG
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# EDITOR

export EDITOR=nvim
export VISUAL=nvim

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Proton Drive directory
export PROTON_DRIVE_DIR="$HOME/Library/CloudStorage/ProtonDrive-raphael@rlemaitre.com-folder"

# Google Drive directory
export GOOGLE_DRIVE_DIR="$HOME/Library/CloudStorage/GoogleDrive-raphael.lemaitre@ledger.fr"
export GOOGLE_DRIVE_PERSO_DIR="$GOOGLE_DRIVE_DIR/My Drive"
export GOOGLE_DRIVE_SHARED_DIR="$GOOGLE_DRIVE_DIR/Shared Drives"

