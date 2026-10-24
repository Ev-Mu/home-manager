[[ -f /etc/NIXOS ]] && exit

shell_path="$HOME/.nix-profile/bin/zsh"

if ! grep -Fxq "$shell_path" /etc/shells; then
  echo -e "\033[1;33mWarning\033[0m: $shell_path does not exist in /etc/shells
  echo -e "\033[0;32mRun\033[0m: echo $shell_path | sudo tee -a /etc/shells"
fi

if [[ "$SHELL" != "$shell_path" ]]; then
  echo -e "\033[1;33mWarning\033[0m: current shell is not $shell_path
  echo -e "\033[0;32mRun\033[0m: chsh -s $shell_path && exec $shell_path"
fi
