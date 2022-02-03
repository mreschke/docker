# Bash Aliases
alias dir='ls -Hhal --color=auto'


# Bash Prompt
function prompt01 {
    local BLUE="\[\033[0;34m\]"
    local DARK_BLUE="\[\033[1;34m\]"
    local RED="\[\033[0;31m\]"
    local DARK_RED="\[\033[1;31m\]"
    local BLACK="\[\033[0;30m\]"
    local GREEN="\[\033[0;32m\]"
    local CYAN="\[\033[0;36m\]"
    local PURPLE="\[\033[0;35m\]"
    local BROWN="\[\033[0;33m\]"
    local NO_COLOR="\[\033[0m\]"

    PS1="$DARK_BLUE\u$NO_COLOR@$CYAN\\h$BROWN\w\n${RED}DOCKER CONTAINER! $GREEN$CYAN\\\$$GREEN → $NO_COLOR"
}
prompt01
