[[ -f /etc/NIXOS ]] && exit

shell_path="$HOME/.nix-profile/bin/zsh"

if ! grep -Fxq "$shell_path" /etc/shells; then
  echo "$shell_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$shell_path" ]]; then
  echo "Changing default shell to zsh..."
  chsh -s "$shell_path"

  echo "Reloading shell..."
  exec "$shell_path"
fi
