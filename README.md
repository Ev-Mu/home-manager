# Home Manager Configuration

A reproducible Home Manager configuration using Nix flakes for managing user environments across different systems and use cases.

![Nix and Home Manager install](https://github.com/Ev-Mu/home-manager/actions/workflows/testCommands.yml/badge.svg)

## Installation

### Quick Install (without cloning)

Run the following command to install Nix and apply the base configuration directly from GitHub:

```sh
wget --output-document=/dev/stdout https://nixos.org/nix/install | sh -s -- --daemon --yes \
&& source /etc/profile \
&& nix --extra-experimental-features 'nix-command flakes' run github:Ev-Mu/home-manager/main#homeConfigurations.base.activationPackage
```

### Install with Clone

For ongoing development and customization, clone the repository first:

1. Generate an SSH key and add it to GitHub:
   ```sh
   ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub
   ```

2. Add the public key to your GitHub account

3. Install Nix and apply the configuration:
   ```sh
   wget --output-document=/dev/stdout https://nixos.org/nix/install | sh -s -- --daemon --yes \
   && source /etc/profile \
   && nix-shell -p home-manager git \
       --run "git clone git@github.com:Ev-Mu/home-manager.git ~/.config/home-manager \
       && home-manager switch -b backup --extra-experimental-features 'nix-command flakes' --flake $HOME/.config/home-manager#base"
   ```

## Repository Structure

```
.
├── flake.nix          # Main flake configuration with inputs and outputs
├── home.nix           # Core Home Manager configuration
├── modules/           # Modular configuration files
│   ├── base/          # Base configuration (includes scripts.nix)
│   └── gui/           # GUI-specific configuration
├── templates/         # Nix flake templates for development environments
└── bin/               # Binary files and executables
```

### Key Files

- **flake.nix** - Defines flake inputs (nixpkgs, home-manager, nixgl) and outputs (configurations, templates)
- **home.nix** - Main Home Manager configuration that imports modules and sets up the user environment
- **modules/base/scripts.nix** - Helper scripts for common operations (nfi, switch)

## Available Configurations

The flake defines three Home Manager configurations for different use cases:

### base
- **User**: emusic
- **Type**: CLI-only configuration
- **Purpose**: Lightweight setup with Essential CLI tools, no GUI applications

### gui
- **User**: emusic
- **Type**: GUI-enabled configuration
- **Purpose**: Full desktop environment with all base packages plus GUI applications

### runner
- **User**: runner
- **Type**: GUI-enabled configuration
- **Purpose**: Configuration for testing configuration changes in GitHub Actions

These configurations exist to support different environments and users while maintaining a consistent configuration approach.

## Templates

This repository includes Nix flake templates for quickly setting up development environments:

### Available Templates

- **go** - Go development environment with necessary tooling
- **npm** - Node.js development environment with npm/yarn support
- **python** - Python development environment with pip and common tools

### Using Templates

Each template includes a `flake.nix` file for dependency management and a `.envrc` file for direnv integration.

To initialize a new project using a template:

```sh
# Using nix directly
nix flake init -t "$HOME/.config/home-manager#<template-name>"

# Using the helper script (after applying configuration)
nfi <template-name>
```

## Helper Scripts

The configuration includes helper scripts defined in `modules/base/scripts.nix`:

### nfi
Initialize a new project using a flake template from this repository.

**Usage:**
```sh
nfi <template-name>
```

**Example:**
```sh
nfi go     # Initialize a Go project
nfi npm    # Initialize a Node.js project
nfi python # Initialize a Python project
```

### switch
Switch Home Manager configurations with automatic backup.

**Usage:**
```sh
switch [config-name]
```

**Examples:**
```sh
switch        # Switch to base configuration (default)
switch gui    # Switch to gui configuration
switch runner # Switch to runner configuration
```

This script automatically creates a backup before switching, making it safe to experiment with configuration changes.

## Resources

For more information about Nix, Home Manager, and flakes, see [RESOURCES.md](RESOURCES.md) for a curated collection of documentation, guides, and references.
