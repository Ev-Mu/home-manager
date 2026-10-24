[[ -f /etc/NIXOS ]] && exit

shell_path="$HOME/.nix-profile/bin/zsh"

if [[ ! -x "$shell_path" ]]; then
  printf '\033[1;33mWarning\033[0m: %s does not exist or is not executable\n' "$shell_path"
  exit 1
fi

if ! grep -Fxq "$shell_path" /etc/shells; then
  printf '\033[1;33mWarning\033[0m: %s is not listed in /etc/shells\n' "$shell_path"
  printf '\033[0;32mRun\033[0m: printf '\''%%s\\n'\'' %q | sudo tee -a /etc/shells\n' "$shell_path"
fi

if [[ "$SHELL" != "$shell_path" ]]; then
  printf '\033[1;33mWarning\033[0m: current shell is not %s\n' "$shell_path"
  printf '\033[0;32mRun\033[0m: chsh -s %q && exec %q\n' "$shell_path" "$shell_path"
fi