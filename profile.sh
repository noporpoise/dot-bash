# Add to your path
export PATH=$PATH:~/bin/

# Add to your perl lib path
export PERL5LIB=${PERL5LIB}:${HOME}/perl/lib/

# Aliases to common ssh
alias myserver='ssh turner@myserver.com'

export TAB=`echo -e "\t"`

# A function for char -> ASCII
function ascii_code { echo -n $1 | od -t u4 -N 1 | grep -m 1 -oP '[1-9]+\d*'; }

# Convert number of bytes to human readable string (using Kb,Mb,Gb,Tb,Pb)
alias mem2str='perl -w -e '"'"'my $x = $ARGV[0]; if(!defined($x) && !defined($x = <>)) { die("Cannot read in");} chomp($x); if($x !~ /^\d*\.?\d*(e[+-]\d*)?$/) { die("Not a number");} my @t = qw(B Kb Mb Gb Tb Pb); my $i=0; for($i=0; $x>=1024; $i++) { $x /= 1024;} printf(($i==0?$x:"%.2f")." $t[$i]\n",$x);'"'"

# Get real memory used by all processes, sum it, convert from kb to bytes, print in human readable
alias mem_vsize='ps -eo vsize | awk '"'"'{s+=$1} END {print s*1024}'"'"' | mem2str'
alias mem_rss='ps -eo rss | awk '"'"'{s+=$1} END {print s*1024}'"'"' | mem2str'
alias mem_used='mem_vsize'

