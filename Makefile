# =======================
# =    STOW COMMANDS    =
# =======================

STOW_INSTALL = stow -t ~ -S
STOW_REMOVE = stow -t ~ -D

# =============================
# =    PER-PACKAGE INSTALL    =
# =============================

bash-install:
	$(STOW_INSTALL) bash

burrow-install:
	$(STOW_INSTALL) burrow

cron-pubnix-install:
	cat ~/dotfiles/cron/pubnix-cron >> ~/dotfiles/my-cron

cron-auto-update-install:
	cat ~/dotfiles/cron/auto-update-cron >> ~/dotfiles/my-cron

cron-install:
	if [ -e ~/dotfiles/my-cron ] ; then crontab ~/dotfiles/my-cron ; fi

gimp-install:
	$(STOW_INSTALL) gimp

git-install:
	$(STOW_INSTALL) git

gnupg-install:
	$(STOW_INSTALL) gnupg

mixxx-install:
	$(STOW_INSTALL) mixxx

oh-my-zsh-install: git-install
	git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
	git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
	ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme

pavucontrol-install:
	$(STOW_INSTALL) pavucontrol

smplayer-install:
	$(STOW_INSTALL) smplayer

ssh-install:
	$(STOW_INSTALL) ssh

thunar-install:
	$(STOW_INSTALL) thunar

tmux-install:
	$(STOW_INSTALL) tmux

vim-install:
	$(STOW_INSTALL) vim

vlc-install:
	$(STOW_INSTALL) vlc

weechat-install:
	$(STOW_INSTALL) weechat

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

gimp-remove:
	$(STOW_REMOVE) gimp

git-remove:
	$(STOW_REMOVE) git

gnupg-remove:
	$(STOW_REMOVE) gnupg

LICENSE-remove:
	$(STOW_REMOVE) LICENSE

Makefile-remove:
	$(STOW_REMOVE) Makefile

mixxx-remove:
	$(STOW_REMOVE) mixxx

oh-my-zsh-remove:
	rm -rf ~/.oh-my-zsh

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

vim-remove:
	$(STOW_REMOVE) vim

vlc-remove:
	$(STOW_REMOVE) vlc

weechat-remove:
	$(STOW_REMOVE) weechat

xarchiver-remove:
	$(STOW_REMOVE) xarchiver

xfce4-remove:
	$(STOW_REMOVE) xfce4

youtube-dl-remove:
	$(STOW_REMOVE) youtube-dl

zsh-remove: oh-my-zsh-remove
	$(STOW_REMOVE) zsh

# =======================
# =    INSTALL TYPES    =
# =======================

install-all: bash-install burrow-install gimp-install git-install gnupg-install mixxx-install oh-my-zsh-install pavucontrol-install smplayer-install ssh-install thunar-install tmux-install vim-install vlc-install weechat-install xarchiver-install xfce4-install youtube-dl-install zsh-install

install-base: bash-install oh-my-zsh-install ssh-install tmux-install vim-install zsh-install

install-home: install-base burrow-install gimp-install git-install gnupg-install pavucontrol-install thunar-install vlc-install xarchiver-install youtube-dl-install

install-server: install-base bash-install git-install

install-pubnix: install-base burrow-install git-install gnupg-install cron-pubnix-install

install-weechat: install-base gnupg-install weechat-install

install-team: install-pubnix youtube-dl-install

install-aussie: install-pubnix install-weechat youtube-dl-install

install-streaming: install-base mixxx-install vlc-install youtube-dl-install

# =================
# =    GENERAL    =
# =================

remove: bash-remove burrow-remove gimp-remove git-remove gnupg-remove mixxx-remove oh-my-zsh-remove pavucontrol-remove smplayer-remove ssh-remove thunar-remove tmux-remove vim-remove vlc-remove weechat-remove xarchiver-remove xfce4-remove youtube-dl-remove zsh-remove

all: help

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
	@printf "all (plain make with no arguments): link to 'help'\\n"
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
	@printf "Each package has a per-package target for install and remove.\\n"
	@printf "These targets allow cherry-picking for adding and\\n"
	@printf "removing dotfiles. These are most useful when:\\n"
	@printf " install) adding a new package after install, however this can\\n"
	@printf "          normally be done by running the same target you\\n"
	@printf " remove)  deciding a package is no longer needed. if a package\\n"
	@printf "          is removed from its install target, re-running the\\n"
	@printf "          install target with not remove it, this must be done\\n"
	@printf "          manually.\\n"
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
