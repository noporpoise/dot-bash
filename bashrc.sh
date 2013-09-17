#
# Examples to add to your ~/.bashrc or ~/.screenrc files
# Includes all 'alias' and 'function' definitions
#

# To use aliases in scripts, you need to add:
# shopt -s expand_aliases
# source ~/.bashrc

# Aliases to common ssh
alias myserver='ssh turner@myserver.com'

# A function for char -> ASCII
function ascii_code { echo -n $1 | od -t u4 -N 1 | grep -m 1 -oE '[1-9]+\d*'; }

# Convert number of bytes to human readable string (using Kb,Mb,Gb,Tb,Pb)
alias mem2str='perl -w -e '"'"'my $x = $ARGV[0];
if(!defined($x) && !defined($x = <>)) { die("Cannot read in");}
chomp($x);
if($x !~ /^\d*\.?\d*(e[+-]\d*)?$/) { die("Not a number");}
my @t = qw(B kB MB GB TB PB);
my $i=0;
for($i=0; $x>=1024; $i++) { $x /= 1024;}
printf(($i==0?$x:"%.2f")." $t[$i]\n",$x);'"'"

# Get virtual memory usage by all processes in human readable
alias mem_vsize='ps -eo vsize | awk '"'"'{s+=$1} END {print s*1024}'"'"' | mem2str'
# Get real memory usage by all processes in human readable
alias mem_rss='ps -eo rss | awk '"'"'{s+=$1} END {print s*1024}'"'"' | mem2str'
# On linux set this to mem_vsize, on mac mem_rss
alias mem_used='mem_vsize'
#alias mem_used='mem_rss'

# Histogram data
alias hist-data="awk '{n[\$1]++} END {for (i in n) print i,n[i]}' | sort -n"

# Functions for VCF files
alias vcf-header="awk '{ if (\$1 ~ /^#/ || \$1 ~ /^\s*$/) { print \$0; } else { exit; } }'"
alias vcf-entries="grep -v '^#'"
alias vcf-pass="awk '\$1 ~ /^#/ || \$7 == "'"PASS"'"'"
alias vcf-fail="awk '\$1 ~ /^#/ || \$7 != "'"PASS"'"'"
alias vcf-count="awk 'BEGIN {i = 0} {if(!(\$1 ~ /^#/ || \$1 == "'""'")) {i += 1;}} END {print i}'"
alias vcf-order="awk '{if(\$0 "'!'"~ /^#/ && \$1 "'!'"= a) {print \$1; a=\$1}}'"

# Functions for SAM files
alias sam-header="awk '{ if (\$1 ~ /^@/ || \$1 ~ /^\s*$/) { print \$0; } else { exit; } }'"
alias sam-entries="grep -v '^@'"
alias sam-count="awk 'BEGIN {i = 0} {if(!(\$1 ~ /^@/ || \$1 == "'""'")) {i += 1;}} END {print i}'"

# Functions on bam files
function bam-sample { samtools view -H $1 | grep -o -m 1 'SM:\w*' | sed 's/^SM://g'; }

# AWK with tab as the separator character
alias tawk='awk -F\\t -v OFS=\\t'

# DNA functions
# Get reverse complement
alias revcmp='perl -s -w -e '"'"'
my %dna;
@dna{qw(a c g t n A C G T N),"\n"} = (qw(t g c a n T G C A N),"\n");
sub revcmp {
  chomp($_[0]);
  print "".($_[0] =~ /^>/ ? $_[0] : join("", map {$dna{$_}} split("",reverse($_[0]))))."\n";
}
if(@ARGV == 0) { push(@ARGV,"-"); }
for $str (@ARGV) { $str eq "-" ? map {revcmp($_)} <STDIN> : revcmp($str); }'"'"

# Get lexically lower dna sequence
function kmerkey {
  FW=$1
  RV=`echo $FW | revcmp`
  if [[ "$FW" < "$RV" ]]; then echo "$FW"; else echo "$RV"; fi
}

# Add bash completion for git commands
# Needs curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
