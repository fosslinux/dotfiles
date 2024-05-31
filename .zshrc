export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"

CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

export LANG=en_AU.UTF-8
export LC_ALL=en_AU.UTF-8

export EDITOR='vim'

# Telmentry optout variables
export SAM_CLI_TELEMETRY=0 # AWS SAM CLI
export STRIPE_CLI_TELEMETRY_OPTOUT=1 # Stripe CLI
export CI=OPTOUT # Apache Cordova CLI
export GATSBY_TELEMETRY_DISABLED=1 # Gatsby
export GAUGE_TELEMETRY_ENABLED=false # Gauge
export HASURA_GRAPHQL_ENABLE_TELEMETRY=false # Hasura GraphQL engine
export DOTNET_CLI_TELEMETRY_OPTOUT=true # .NET Core
export NEXT_TELEMETRY_DISABLED=1 # Next.js
export AUTOMATEDLAB_TELEMETRY_OPTOUT=1 # AutomatedLab
export POWERSHELL_TELEMETRY_OPTOUT=1 # PowerShell

source .zshvars

eval $(ssh-agent) >/dev/null

umask 007 # security
