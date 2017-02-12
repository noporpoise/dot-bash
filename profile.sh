#
# Examples to add to your ~/.profile or ~/.bash_profile files
# Includes all exported variable definitions
#

# Color in your terminal
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# Func to gen PS1 after CMDs
export PROMPT_COMMAND="__prompt_command; ${PROMPT_COMMAND}"

# From: 'Bash Prompt with Last Exit Code'
# http://stackoverflow.com/a/16715681/431087
__prompt_command() {
    local EXIT="$?"             # This needs to be first
    PS1=""

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

    if [ $EXIT != 0 ]; then
        PS1+="${Red}\u${RCol}"      # Add red if exit code non 0
    else
        PS1+="${Gre}\u${RCol}"
    fi

    PS1+="${RCol}@${BBlu}\h ${Pur}\W${BYel}$ ${RCol}"
}

# Add to your path
export PATH=$PATH:~/bin/

# Add to your perl lib path
export PERL5LIB=${PERL5LIB}:${HOME}/perl/lib/

# Set the variable $TAB to be the tab character
export TAB=`echo -e "\t"`

# Print return codes on failure
# http://david.newgas.net/return_code/
# export PROMPT_COMMAND='ret=$?; if [ $ret -ne 0 ] ; then echo -e "returned \033[01;31m$ret\033[00;00m"; fi'
