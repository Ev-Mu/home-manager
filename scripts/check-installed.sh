packages=(
  firefox
  curl
  git
  vim
)

installed=()

for pkg in "${packages[@]}"; do
  if [[ -f "/usr/bin/$pkg" ]]; then
    installed+=("$pkg")
  fi
done

if [ ${#installed[@]} -gt 0 ]; then
  echo -e "\033[1;33mWarning\033[0m: These system packages may conflict with Nix packages:"
  printf '  - %s\n' "${installed[@]}"

  if [[ -f /etc/debian_version ]]; then
    echo -e "\033[0;32mRun:\033[0m sudo apt purge --auto-remove ${installed[*]} -y"
  elif [[ -f /etc/arch-release ]]; then
    echo -e "\033[0;32mRun:\033[0m sudo pacman -Rns ${installed[*]}"
  elif [[ -f /etc/fedora-release ]]; then
    echo -e "\033[0;32mRun:\033[0m sudo dnf remove ${installed[*]} -y"
  else
    echo "Could not determine package manager."
  fi
fi
