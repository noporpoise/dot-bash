# Add to your path
export PATH=$PATH:~/bin/

# Add to your perl lib path
export PERL5LIB=${PERL5LIB}:${HOME}/perl/lib/

# Aliases to common ssh
alias myserver='ssh turner@myserver.com'

# Set the variable $TAB to be the tab character
export TAB=`echo -e "\t"`

# A function for char -> ASCII
function ascii_code { echo -n $1 | od -t u4 -N 1 | grep -m 1 -oE '[1-9]+\d*'; }
