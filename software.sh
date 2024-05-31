#!/bin/sh

# Check existance of software

command -v tmux >/dev/null 2>&1 && TMUX=1 || TMUX=0
command -v zsh >/dev/null 2>&1 && ZSH=1 || ZSH=0
command -v git >/dev/null 2>&1 && GIT=1 || GIT=0
command -v curl >/dev/null 2>&1 && CURL=1 || CURL=0
command -v wget >/dev/null 2>&1 && WGET=1 || WGET=0

# Alert if not installed

[ "${TMUX}" -eq 0 ] && printf "tmux is not installed!\\n"
[ "${ZSH}" -eq 0 ] && printf "zsh is not installed!\\n"
[ "${GIT}" -eq 0 ] && printf "git is not installed!\\n"
[ "${CURL}" -eq 0 ] || [ "${WGET}" -eq 0 ] && printf "wget/curl is not installed!\\n"
