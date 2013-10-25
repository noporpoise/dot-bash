#
# Examples to add to your ~/.profile or ~/.bash_profile files
# Includes all exported variable definitions
#

# Add to your path
export PATH=$PATH:~/bin/

# Add to your perl lib path
export PERL5LIB=${PERL5LIB}:${HOME}/perl/lib/

# Set the variable $TAB to be the tab character
export TAB=`echo -e "\t"`

# Print return codes on failure
# http://david.newgas.net/return_code/
export PROMPT_COMMAND='ret=$?; if [ $ret -ne 0 ] ; then echo -e "returned \033[01;31m$ret\033[00;00m"; fi'
