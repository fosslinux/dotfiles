#!/bin/sh

# Try $PREFIX, then $HOME, then ~
PREFIX="${PREFIX:-${HOME:-~}}"

# Create .config
if [ ! -d "${PREFIX}/.config" ] ; then
    printf "Creating %s/.config\\n" "${PREFIX}"
    mkdir "${PREFIX}/.config"
fi

# Rename file to .bak if it exists
if_exists() {
    file=${1}
    if [ -e "${PREFIX}/${file}" ] ; then
        mv "${PREFIX}/${file}" "${PREFIX}/${file}.bak"
    fi
}

install() {
    file=${1}
    if [ -d "${file}" ] ; then
        printf "Creating %s\\n" "${PREFIX}/${file}"
        mkdir -p "${PREFIX}/${file}"
        for subfile in ${file}/* ; do
            install "${subfile}"
        done
    else
        printf "Installing %s\\n" "${PREFIX}/${file}"
        if_exists "${file}"
        cp "${file}" "${PREFIX}/${file}"
    fi
}

# Install the files
for file in .* ; do
    # Exclude files we obviously don't want to install
    if [ "${file}" != "." ] \
      && [ "${file}" != ".." ] \
      && [ "${file}" != ".git" ] ; then
        # This will recurse into .config
        install "${file}"
    fi
done

# Install oh-my-zsh 
printf "Install oh-my-zsh\\n"
RUNZSH=no ZSH="${PREFIX}/.oh-my-zsh" ./oh-my-zsh-install.sh
printf "\\nInstall oh-my-zsh spaceship theme\\n"
git clone https://github.com/denysdovhan/spaceship-prompt.git "${PREFIX}/.oh-my-zsh/themes/spaceship-prompt"
ln -s "${PREFIX}/.oh-my-zsh/themes/spaceship-prompt/spaceship.zsh-theme" "${PREFIX}/.oh-my-zsh/themes/spaceship.zsh-theme"
printf "\\n"

# Install Vundle
printf "Install vundle\\n"
if_exists "${PREFIX}/.vim/bundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
