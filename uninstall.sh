#!/bin/sh

# Try $PREFIX, then $HOME, then ~
PREFIX="${PREFIX:-${HOME:-~}}"

uninstall() {
    file=${1}
    if [ -d "${file}" ] ; then
        for subfile in ${file}/* ; do
            uninstall "${subfile}"
        done
        rmdir "${PREFIX}/${file}" && printf "Removing empty directory %s" "${file}" || true
    else
        printf "Removing file %s\\n" "${PREFIX}/${file}"
        rm -f "${PREFIX}/${file}" 
    fi
}

# Remove oh-my-zsh
printf "Removing .oh-my-zsh\\n"
rm -rf "${PREFIX}/.oh-my-zsh" 
# Remove vim bundles
printf "Removing .vim/bundle\\n"
rm -rf "${PREFIX}/.vim/bundle" 

for file in .* ; do
    # Excludes
    if [ "${file}" != "." ] \
      && [ "${file}" != ".." ] \
      && [ "${file}" != ".git" ] ; then
        uninstall "${file}"
    fi
done
