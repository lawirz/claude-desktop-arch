# Claude Desktop for Arch Linux

This repository contains a PKGBUILD file to build and install Claude Desktop on Arch Linux and Arch-based distributions (like Manjaro, EndeavourOS, etc.).
Credits go to [claude-desktop-debian](https://github.com/aaddrick/claude-desktop-debian) which is the base for this repository.

## Building and Installing

### Option 1: Using the Installation Script

The easiest way to install is to use the provided installation script:

```bash
git clone https://github.com/h-filzer/claude-desktop-arch.git
cd claude-desktop-arch
./install.sh
```

This script will:
1. Check if you're running an Arch-based system
2. Install all required dependencies (will prompt for sudo password)
3. Build the package as a regular user (not as root)
4. Install the built package (will use sudo)

**Important**: Do not run the script with sudo, as `makepkg` should not be run as root. The script will use sudo only when necessary for installing dependencies and the final package.

### Option 2: Manual Build

If you prefer to build the package manually:

1. Clone this repository:

```bash
git clone https://github.com/h-filzer/claude-desktop-arch.git
cd claude-desktop-arch
```

2. Build and install the package:

```bash
makepkg -si
```

The `-si` flag will install any required dependencies and the package after building. There's no need to manually install dependencies beforehand.

**Important**: Do not run `makepkg` with sudo, as it should not be run as root. The `-si` flag will automatically use sudo when needed to install dependencies and the package.

## Manual Installation

If you prefer to install the package manually after building:

```bash
sudo pacman -U claude-desktop-*.pkg.tar.zst
```

## Running Claude Desktop

After installation, you can run Claude Desktop from your application menu or by typing:

```bash
claude-desktop
```

### Permission Issues

If you encounter permission issues, make sure the launcher script is executable:

```bash
sudo chmod +x /usr/sbin/claude-desktop
```

When the login does not work you can try to run the following command to update the registered `claude://` URL-sheme:

```bash
sudo update-desktop-database /usr/share/applications

```

## Updating

When a new version of Claude Desktop is released, update the `_download_url` variable in the PKGBUILD file and rebuild the package.

## How It Works

This package:

1. Downloads the Windows installer for Claude Desktop
2. Extracts the necessary files and resources
3. Creates a stub implementation for Windows-specific native modules
4. Packages everything into an Arch Linux package
5. Sets up desktop integration (icons, launcher, etc.)

## License

This PKGBUILD is provided under the same license as the original claude-desktop-debian application:

The build scripts in this repository, are dual-licensed under the terms of the MIT license and the Apache License (Version 2.0).

See [LICENSE-MIT](LICENSE-MIT) and [LICENSE-APACHE](LICENSE-APACHE) for details.

The Claude Desktop application, not included in this repository, is likely covered by [Anthropic's Consumer Terms](https://www.anthropic.com/legal/consumer-terms).

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall be dual licensed as above, without any
additional terms or conditions.
