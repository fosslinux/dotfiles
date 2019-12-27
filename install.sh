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

# Install the files
for file in .* ; do
    # Exclude files we obviously don't want to install
    if [ "${file}" != "." ] \
      && [ "${file}" != ".." ] \
      && [ "${file}" != ".git" ] ; then

        # If its .config, recruse
        if [ "${file}" = ".config" ] ; then
            for file in .config/* ; do
                # Install .config/$file
                printf "Installing %s to %s/.config\\n" "${file#".config/"}" "${PREFIX}"
                if_exists "${file}"
                cp -r "${file}" "${PREFIX}/.config/"
            done
        else
            # Install $file
            printf "Installing %s to %s\\n" "${file#"."}" "${PREFIX}"
            if_exists "${file}"
            cp -r "${file}" "${PREFIX}/"
        fi
    fi
done

# Install oh-my-zsh 
printf "Install oh-my-zsh\\n"
if_exists ".oh-my-zsh"
RUNZSH=no ZSH="${PREFIX}/.oh-my-zsh" ./oh-my-zsh-install.sh
printf "\\nInstall oh-my-zsh spaceship theme\\n"
git clone https://github.com/denysdovhan/spaceship-prompt.git "${PREFIX}/.oh-my-zsh/themes/spaceship.zsh-theme"
printf "\\n"

# Install Vundle
printf "Install vundle\\n"
if_exists "${PREFIX}/.vim/bundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
