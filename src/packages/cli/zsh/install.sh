#!/bin/sh

set -ex

current_dir="${0%/*}"
container_init_directory="${1}"

echo "Copying zsh initial scripts to the global init directory"
cp -R "${current_dir}/init.d/." "${container_init_directory}"

# Install oh-my-zsh (requries git)
pkg git zsh curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
