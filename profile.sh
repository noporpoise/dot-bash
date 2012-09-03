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

# Convert number of bytes to human readable string (using Kb,Mb,Gb,Tb,Pb)
alias mem2str='perl -w -e '"'"'my $x = $ARGV[0]; if(!defined($x) && !defined($x = <>)) { die("Cannot read in");} chomp($x); if($x !~ /^\d*\.?\d*(e[+-]\d*)?$/) { die("Not a number");} my @t = qw(B Kb Mb Gb Tb Pb); my $i=0; for($i=0; $x>=1024; $i++) { $x /= 1024;} printf(($i==0?$x:"%.2f")." $t[$i]\n",$x);'"'"

# Get virtual memory usage by all processes in human readable
alias mem_vsize='ps -eo vsize | awk '"'"'{s+=$1} END {print s*1024}'"'"' | mem2str'
# Get real memory usage by all processes in human readable
alias mem_rss='ps -eo rss | awk '"'"'{s+=$1} END {print s*1024}'"'"' | mem2str'
# On linux set this to mem_vsize, on mac mem_rss
alias mem_used='mem_vsize'
#alias mem_used='mem_rss'
