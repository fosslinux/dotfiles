# =======================
# =    STOW COMMANDS    =
# =======================

STOW_INSTALL = stow -t ~ -S
STOW_REMOVE = stow -t ~ -D
STOW_UPDATE = stow -t ~ -R

# =============================
# =    PER-PACKAGE INSTALL    =
# =============================

bash-install:
	$(STOW_INSTALL) bash

burrow-install:
	$(STOW_INSTALL) burrow

byobu-install:
	$(STOW_INSTALL) byobu

fontconfig-install:
	$(STOW_INSTALL) fontconfig

fonts-install: fontconfig-install
	$(STOW_INSTALL) fonts

gimp-install:
	$(STOW_INSTALL) gimp

git-install:
	$(STOW_INSTALL) git

gnupg-install:
	$(STOW_INSTALL) gnupg

libreoffice-install:
	$(STOW_INSTALL) libreoffice

links2-install:
	$(STOW_INSTALL) links2

mixxx-install:
	$(STOW_INSTALL) mixxx

node-install:
	$(STOW_INSTALL) node

npm-install: node-install
	$(STOW_INSTALL) npm

oh-my-zsh-install: zsh-install
	$(STOW_INSTALL) oh-my-zsh

pavucontrol-install:
	$(STOW_INSTALL) pavucontrol

smplayer-install:
	$(STOW_INSTALL) smplayer

ssh-install:
	$(STOW_INSTALL) ssh

subversion-install:
	$(STOW_INSTALL) subversion

thunar-install:
	$(STOW_INSTALL) thunar

tig-install: git-install
	$(STOW_INSTALL) tig

tmux-install:
	$(STOW_INSTALL) tmux

torbrowser-install:
	$(STOW_INSTALL) torbrowser

vim-install:
	$(STOW_INSTALL) vim

vlc-install:
	$(STOW_INSTALL) vlc

vscode-install:
	$(STOW_INSTALL) vscode

w3m-install:
	$(STOW_INSTALL) w3m

weechat-install:
	$(STOW_INSTALL) weechat

wget-install:
	$(STOW_INSTALL) wget

xarchiver-install:
	$(STOW_INSTALL) xarchiver

xfce4-install:
	$(STOW_INSTALL) xfce4

youtube-dl-install:
	$(STOW_INSTALL) youtube-dl

zsh-install:
	$(STOW_INSTALL) zsh

# ============================
# =    PER-PACKAGE REMOVE    = 
# ============================

bash-remove:
	$(STOW_REMOVE) bash

burrow-remove:
	$(STOW_REMOVE) burrow

byobu-remove:
	$(STOW_REMOVE) byobu

fontconfig-remove: fonts-remove
	$(STOW_REMOVE) fontconfig

fonts-remove:
	$(STOW_REMOVE) fonts

gimp-remove:
	$(STOW_REMOVE) gimp

git-remove: tig-remove
	$(STOW_REMOVE) git

gnupg-remove:
	$(STOW_REMOVE) gnupg

libreoffice-remove:
	$(STOW_REMOVE) libreoffice

LICENSE-remove:
	$(STOW_REMOVE) LICENSE

links2-remove:
	$(STOW_REMOVE) links2

Makefile-remove:
	$(STOW_REMOVE) Makefile

mixxx-remove:
	$(STOW_REMOVE) mixxx

node-remove: npm-remove
	$(STOW_REMOVE) node

npm-remove:
	$(STOW_REMOVE) npm

oh-my-zsh-remove:
	$(STOW_REMOVE) oh-my-zsh

pavucontrol-remove:
	$(STOW_REMOVE) pavucontrol

smplayer-remove:
	$(STOW_REMOVE) smplayer

ssh-remove:
	$(STOW_REMOVE) ssh

subversion-remove:
	$(STOW_REMOVE) subversion

thunar-remove:
	$(STOW_REMOVE) thunar

tig-remove:
	$(STOW_REMOVE) tig

tmux-remove:
	$(STOW_REMOVE) tmux

torbrowser-remove:
	$(STOW_REMOVE) torbrowser

vim-remove:
	$(STOW_REMOVE) vim

vlc-remove:
	$(STOW_REMOVE) vlc

vscode-remove:
	$(STOW_REMOVE) vscode

w3m-remove:
	$(STOW_REMOVE) w3m

weechat-remove:
	$(STOW_REMOVE) weechat

wget-remove:
	$(STOW_REMOVE) wget

xarchiver-remove:
	$(STOW_REMOVE) xarchiver

xfce4-remove:
	$(STOW_REMOVE) xfce4

youtube-dl-remove:
	$(STOW_REMOVE) youtube-dl

zsh-remove: oh-my-zsh-remove
	$(STOW_REMOVE) zsh

# ============================
# =    PER-PACKAGE UPDATE    =
# ============================

bash-update:
	$(STOW_UPDATE) bash

burrow-update:
	$(STOW_UPDATE) burrow

byobu-update:
	$(STOW_UPDATE) byobu

fontconfig-update:
	$(STOW_UPDATE) fontconfig

fonts-update:
	$(STOW_UPDATE) fonts

gimp-update:
	$(STOW_UPDATE) gimp

git-update:
	$(STOW_UPDATE) git

gnupg-update:
	$(STOW_UPDATE) gnupg

libreoffice-update:
	$(STOW_UPDATE) libreoffice

LICENSE-update:
	$(STOW_UPDATE) LICENSE

links2-update:
	$(STOW_UPDATE) links2

Makefile-update:
	$(STOW_UPDATE) Makefile

mixxx-update:
	$(STOW_UPDATE) mixxx

node-update:
	$(STOW_UPDATE) node

npm-update:
	$(STOW_UPDATE) npm

oh-my-zsh-update:
	$(STOW_UPDATE) oh-my-zsh

pavucontrol-update:
	$(STOW_UPDATE) pavucontrol

smplayer-update:
	$(STOW_UPDATE) smplayer

ssh-update:
	$(STOW_UPDATE) ssh

subversion-update:
	$(STOW_UPDATE) subversion

thunar-update:
	$(STOW_UPDATE) thunar

tig-update:
	$(STOW_UPDATE) tig

tmux-update:
	$(STOW_UPDATE) tmux

torbrowser-update:
	$(STOW_UPDATE) torbrowser

vim-update:
	$(STOW_UPDATE) vim

vlc-update:
	$(STOW_UPDATE) vlc

vscode-update:
	$(STOW_UPDATE) vscode

w3m-update:
	$(STOW_UPDATE) w3m

weechat-update:
	$(STOW_UPDATE) weechat

wget-update:
	$(STOW_UPDATE) wget

xarchiver-update:
	$(STOW_UPDATE) xarchiver

xfce4-update:
	$(STOW_UPDATE) xfce4

youtube-dl-update:
	$(STOW_UPDATE) youtube-dl

zsh-update:
	$(STOW_UPDATE) zsh

# =======================
# =    INSTALL TYPES    =
# =======================

install-all: bash-install burrow-install byobu-install fontconfig-install fonts-install gimp-install git-install gnupg-install libreoffice-install links2-install mixxx-install node-install npm-install oh-my-zsh-install pavucontrol-install smplayer-install ssh-install subversion-install thunar-install tig-install tmux-install torbrowser-install vim-install vlc-install vscode-install w3m-install weechat-install wget-install xarchiver-install xfce4-install youtube-dl-install zsh-install

install-base: bash-install fontconfig-install fonts-install oh-my-zsh-install ssh-install tmux-install vim-install zsh-install

install-home: install-base burrow-install gimp-install git-install gnupg-install libreoffice-install node-install npm-install pavucontrol-install torbrowser-install thunar-install tig-install vlc-install wget-install xarchiver-install youtube-dl-install

install-pubnix: install-base burrow-install gnupg-install wget-install

install-team: install-pubnix youtube-dl-install

install-weechat: install-base gnupg-install weechat-install

install-streaming: install-base mixxx-install vlc-install youtube-dl-install

# =================
# =    GENERAL    =
# =================

remove: bash-remove burrow-install byobu-install fontconfig-install fonts-install gimp-install git-install gnupg-install libreoffice-install links2-install mixxx-install node-install npm-install oh-my-zsh-install pavucontrol-install smplayer-install ssh-install subversion-install thunar-install tig-install tmux-install torbrowser-install vim-install vlc-install vscode-install w3m-install weechat-install wget-install xarchiver-install xfce4-install youtube-dl-install zsh-install

update: bash-remove burrow-install byobu-install fontconfig-install fonts-install gimp-install git-install gnupg-install libreoffice-install links2-install mixxx-install node-install npm-install oh-my-zsh-install pavucontrol-install smplayer-install ssh-install subversion-install thunar-install tig-install tmux-install torbrowser-install vim-install vlc-install vscode-install w3m-install weechat-install wget-install xarchiver-install xfce4-install youtube-dl-install zsh-install

all: update

install:
	printf "Please choose an install type:\\n"
	printf " - install-all: install everything\\n"
	printf " - install-base: just install base everyday use packages\\n"
	printf " - install-home: install stuff that i use on\\n"
	printf "   home machines + base\\n"
	printf " - install-pubnix: install stuff that i use on pubnixes + base\\n"
	printf " - install-team: install stuff i specifically use on\\n"
	printf "   ~team + pubnix\\n"
	printf " - install-weechat: install stuff needed for weechat + base\\n"
	printf " - install-streaming: install stuff for streaming + base\\n
	printf "    (rarely used)\\n"

help:
	printf "==========================\\n"
	printf "=    GENERAL COMMANDS    =\\n"
	printf "==========================\\n"
	printf "\\n"
	printf "install: shows help for install types\\n"
	printf "remove: removes dotfiles from system\\n"
	printf "update: updates dotfiles (normally run after git pull\\n"
	printf "all (plain make with no arguments): link to 'update'\\n"
	printf "\\n"
	printf "=======================\\n"
	printf "=    INSTALL TYPES    =\\n"
	printf "=======================\\n"
	printf "\\n"
	printf "Install types:\\n"
	printf " - install-all: install everything\\n"
	printf " - install-base: just install base everyday use packages\\n"
	printf " - install-home: install stuff that i use on\\n"
	printf "   home machines + base\\n"
	printf " - install-pubnix: install stuff that i use on pubnixes + base\\n"
	printf " - install-team: install stuff i specifically use on\\n"
	printf "   ~team + pubnix\\n"
	printf " - install-weechat: install stuff needed for weechat + base\\n"
	printf " - install-streaming: install stuff for streaming + base\\n
	printf "    (rarely used)\\n"
	printf "\\n"
	printf "=============================\\n"
	printf "=    PER-PACKAGE TARGETS    =\\n"
	printf "=============================\\n"
	printf "\\n"
	printf "Each package has a per-package target for install, remove and\\n"
	printf "update. These targets allow cherry-picking for adding and\\n"
	printf "removing dotfiles. These are most useful when:\\n"
	printf " install) adding a new package after install, however this can\\n"
	printf "          normally be done by running the same target you\\n"
	printf "          installed with if it was added to that target.\\n"
	printf " remove)  deciding a package is no longer needed. if a package\\n"
	printf "          is removed from its install target, re-running the\\n"
	printf "          install target with not remove it, this must be done\\n"
	printf "          manually.\\n"
	printf " update)  rarely used. normally only used if there is\\n"
	printf "          a conflict, or you get in a broken scenario.\\n"
	printf "          please note that this under the hood reinstalls the\\n"
	printf "          package, so you can use this to attempt to fix\\n"
	printf "          broken stuff.\\n"
	printf "\\n"
	printf "===================\\n"
	printf "=    LICENSING    =\\n"
	printf "===================\\n"
	printf "Copyright (c) 2018 fosslinux\\n"
	printf "\\n"
	printf "Permission is hereby granted, free of charge, to any person obtaining a copy\\n"
	printf "of this software and associated documentation files (the "Software"), to deal\\n"
	printf "in the Software without restriction, including without limitation the rights\\n"
	printf "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell\\n"
	printf "copies of the Software, and to permit persons to whom the Software is\\n"
	printf "furnished to do so, subject to the following conditions:\\n"
	printf "\\n"
	printf "The above copyright notice and this permission notice shall be included in all\\n"
	printf "copies or substantial portions of the Software.\\n"
	printf "\\n"
	printf "THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\\n"
	printf "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\\n"
	printf "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\\n"
	printf "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\\n"
	printf "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\\n"
	printf "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE\\n"
	printf "SOFTWARE.\\n"
