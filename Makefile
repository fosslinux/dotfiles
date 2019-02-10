# =======================
# =    STOW COMMANDS    =
# =======================

STOW_INSTALL = stow -t ~ -S
STOW_REMOVE = stow -t ~ -D
STOW_UPDATE = ./stow_update

# =============================
# =    PER-PACKAGE INSTALL    =
# =============================

bash-install:
	$(STOW_INSTALL) bash
	echo 'bash' >> installed

burrow-install:
	$(STOW_INSTALL) burrow
	echo 'burrow' >> installed

gimp-install:
	$(STOW_INSTALL) gimp
	echo 'gimp' >> installed

git-install:
	$(STOW_INSTALL) git
	echo 'git' >> installed

gnupg-install:
	$(STOW_INSTALL) gnupg
	echo 'gnupg' >> installed

libreoffice-install:
	$(STOW_INSTALL) libreoffice
	echo 'libreoffice' >> installed

LICENSE-install:
	$(STOW_INSTALL) LICENSE
	echo 'LICENSE' >> installed

Makefile-install:
	$(STOW_INSTALL) Makefile
	echo 'Makefile' >> installed

mixxx-install:
	$(STOW_INSTALL) mixxx
	echo 'mixxx' >> installed

oh-my-zsh-install:
	$(STOW_INSTALL) oh-my-zsh
	echo 'oh-my-zsh' >> installed

pavucontrol-install:
	$(STOW_INSTALL) pavucontrol
	echo 'pavucontrol' >> installed

smplayer-install:
	$(STOW_INSTALL) smplayer
	echo 'smplayer' >> installed

ssh-install:
	$(STOW_INSTALL) ssh
	echo 'ssh' >> installed

thunar-install:
	$(STOW_INSTALL) thunar
	echo 'thunar' >> installed

tmux-install:
	$(STOW_INSTALL) tmux
	echo 'tmux' >> installed

vim-install:
	$(STOW_INSTALL) vim
	echo 'vim' >> installed

vlc-install:
	$(STOW_INSTALL) vlc
	echo 'vlc' >> installed

weechat-install:
	$(STOW_INSTALL) weechat
	echo 'weechat' >> installed

wget-install:
	$(STOW_INSTALL) wget
	echo 'wget' >> installed

xarchiver-install:
	$(STOW_INSTALL) xarchiver
	echo 'xarchiver' >> installed

xfce4-install:
	$(STOW_INSTALL) xfce4
	echo 'xfce4' >> installed

youtube-dl-install:
	$(STOW_INSTALL) youtube-dl
	echo 'youtube-dl' >> installed

zsh-install:
	$(STOW_INSTALL) zsh
	echo 'zsh' >> installed
# ============================
# =    PER-PACKAGE REMOVE    = 
# ============================

bash-remove:
	$(STOW_REMOVE) bash

burrow-remove:
	$(STOW_REMOVE) burrow

gimp-remove:
	$(STOW_REMOVE) gimp

git-remove:
	$(STOW_REMOVE) git

gnupg-remove:
	$(STOW_REMOVE) gnupg

libreoffice-remove:
	$(STOW_REMOVE) libreoffice

LICENSE-remove:
	$(STOW_REMOVE) LICENSE

Makefile-remove:
	$(STOW_REMOVE) Makefile

mixxx-remove:
	$(STOW_REMOVE) mixxx

oh-my-zsh-remove:
	$(STOW_REMOVE) oh-my-zsh

pavucontrol-remove:
	$(STOW_REMOVE) pavucontrol

smplayer-remove:
	$(STOW_REMOVE) smplayer

ssh-remove:
	$(STOW_REMOVE) ssh

thunar-remove:
	$(STOW_REMOVE) thunar

tmux-remove:
	$(STOW_REMOVE) tmux

torbrowser-remove:
	$(STOW_REMOVE) torbrowser

vim-remove:
	$(STOW_REMOVE) vim

vlc-remove:
	$(STOW_REMOVE) vlc

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

Makefile-update:
	$(STOW_UPDATE) Makefile

mixxx-update:
	$(STOW_UPDATE) mixxx

oh-my-zsh-update:
	$(STOW_UPDATE) oh-my-zsh

pavucontrol-update:
	$(STOW_UPDATE) pavucontrol

smplayer-update:
	$(STOW_UPDATE) smplayer

ssh-update:
	$(STOW_UPDATE) ssh

thunar-update:
	$(STOW_UPDATE) thunar

tmux-update:
	$(STOW_UPDATE) tmux

torbrowser-update:
	$(STOW_UPDATE) torbrowser

vim-update:
	$(STOW_UPDATE) vim

vlc-update:
	$(STOW_UPDATE) vlc

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

install-all: bash-install burrow-install gimp-install git-install gnupg-install libreoffice-install mixxx-install oh-my-zsh-install pavucontrol-install smplayer-install ssh-install thunar-install tmux-install torbrowser-install vim-install vlc-install weechat-install wget-install xarchiver-install xfce4-install youtube-dl-install zsh-install

install-base: bash-install oh-my-zsh-install ssh-install tmux-install vim-install zsh-install

install-home: install-base burrow-install gimp-install git-install gnupg-install libreoffice-install pavucontrol-install torbrowser-install thunar-install vlc-install wget-install xarchiver-install youtube-dl-install

install-pubnix: install-base burrow-install gnupg-install wget-install

install-team: install-pubnix youtube-dl-install

install-weechat: install-base gnupg-install weechat-install

install-streaming: install-base mixxx-install vlc-install youtube-dl-install

# =================
# =    GENERAL    =
# =================

remove: bash-remove burrow-install gimp-install git-install gnupg-install libreoffice-install mixxx-install oh-my-zsh-install pavucontrol-install smplayer-install ssh-install thunar-install tmux-install torbrowser-install vim-install vlc-install weechat-install wget-install xarchiver-install xfce4-install youtube-dl-install zsh-install

update: bash-update burrow-update gimp-update git-update gnupg-update libreoffice-update ixxx-update oh-my-zsh-update pavucontrol-update smplayer-update ssh-update thunar-update tmux-update torbrowser-update vim-update vlc-update weechat-update wget-update xarchiver-update xfce4-update youtube-dl-update zsh-update

all: update

install:
	@printf "Please choose an install type:\\n"
	@printf " - install-all: install everything\\n"
	@printf " - install-base: just install base everyday use packages\\n"
	@printf " - install-home: install stuff that i use on\\n"
	@printf "   home machines + base\\n"
	@printf " - install-pubnix: install stuff that i use on pubnixes + base\\n"
	@printf " - install-team: install stuff i specifically use on\\n"
	@printf "   ~team + pubnix\\n"
	@printf " - install-weechat: install stuff needed for weechat + base\\n"
	@printf " - install-streaming: install stuff for streaming + base\\n"
	@printf "    (rarely used)\\n"

help:
	@printf "==========================\\n"
	@printf "=    GENERAL COMMANDS    =\\n"
	@printf "==========================\\n"
	@printf "\\n"
	@printf "install: shows help for install types\\n"
	@printf "remove: removes dotfiles from system\\n"
	@printf "update: updates dotfiles (normally run after git pull\\n"
	@printf "all (plain make with no arguments): link to 'update'\\n"
	@printf "\\n"
	@printf "=======================\\n"
	@printf "=    INSTALL TYPES    =\\n"
	@printf "=======================\\n"
	@printf "\\n"
	@printf "Install types:\\n"
	@printf " - install-all: install everything\\n"
	@printf " - install-base: just install base everyday use packages\\n"
	@printf " - install-home: install stuff that i use on\\n"
	@printf "   home machines + base\\n"
	@printf " - install-pubnix: install stuff that i use on pubnixes + base\\n"
	@printf " - install-team: install stuff i specifically use on\\n"
	@printf "   ~team + pubnix\\n"
	@printf " - install-weechat: install stuff needed for weechat + base\\n"
	@printf " - install-streaming: install stuff for streaming + base\\n"
	@printf "    (rarely used)\\n"
	@printf "\\n"
	@printf "=============================\\n"
	@printf "=    PER-PACKAGE TARGETS    =\\n"
	@printf "=============================\\n"
	@printf "\\n"
	@printf "Each package has a per-package target for install, remove and\\n"
	@printf "update. These targets allow cherry-picking for adding and\\n"
	@printf "removing dotfiles. These are most useful when:\\n"
	@printf " install) adding a new package after install, however this can\\n"
	@printf "          normally be done by running the same target you\\n"
	@printf "          installed with if it was added to that target.\\n"
	@printf " remove)  deciding a package is no longer needed. if a package\\n"
	@printf "          is removed from its install target, re-running the\\n"
	@printf "          install target with not remove it, this must be done\\n"
	@printf "          manually.\\n"
	@printf " update)  rarely used. normally only used if there is\\n"
	@printf "          a conflict, or you get in a broken scenario.\\n"
	@printf "          please note that this under the hood reinstalls the\\n"
	@printf "          package, so you can use this to attempt to fix\\n"
	@printf "          broken stuff.\\n"
	@printf "\\n"
	@printf "===================\\n"
	@printf "=    LICENSING    =\\n"
	@printf "===================\\n"
	@printf "\\n"
	@printf "Copyright (c) 2018 fosslinux\\n"
	@printf "\\n"
	@printf "Permission is hereby granted, free of charge, to any person obtaining a copy\\n"
	@printf "of this software and associated documentation files (the "Software"), to deal\\n"
	@printf "in the Software without restriction, including without limitation the rights\\n"
	@printf "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell\\n"
	@printf "copies of the Software, and to permit persons to whom the Software is\\n"
	@printf "furnished to do so, subject to the following conditions:\\n"
	@printf "\\n"
	@printf "The above copyright notice and this permission notice shall be included in all\\n"
	@printf "copies or substantial portions of the Software.\\n"
	@printf "\\n"
	@printf "THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\\n"
	@printf "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\\n"
	@printf "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\\n"
	@printf "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\\n"
	@printf "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\\n"
	@printf "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE\\n"
	@printf "SOFTWARE.\\n"
