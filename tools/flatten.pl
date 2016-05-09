#!/usr/bin/perl -w

# Usage:
# buildFile.pl main-file.tex > main-file_flat.tex
#     
sub p_inc {
  $DateiName = shift;
    if ( open (my $fh,"<:encoding(UTF-8)", "$DateiName.tex") )
	{
      print "%%%---------- open: ", $DateiName, ".tex\n";
		while (my $zeile = <$fh>){
			if ($zeile =~/^\s*\\input \s+(\S+).tex/i) {
			  my ($path,$file) = $DateiName =~ m|^(.*[/\\])([^/\\]+?)$|;
			  my $include = $path.$1;
			  chomp($include);
			  print "%%%%%%%%% Springe nach ", $include, "\n";
			  p_inc($include);
			} else
			{
			next if $zeile =~ /.*\\endinput.*/;
			print $zeile; 
			}
		}
		print "%%%---------- close: ", $DateiName, "\n";
		close $fh;
	} else 
	{ print "%%%<===== Datei existiert nicht\n"; }
}

my $filename = shift @ARGV;
my ($path,$file) = $filename =~ m|^(.*[/\\])([^/\\]+?)$|;
open (my $fh, "<:encoding(UTF-8)",$filename) or die $!;
while (my $zeile = <$fh>)
{
 # next if $zeile =~ /^\s$/;
 # next if $zeile =~ /^\s*(%)/;
  if ($zeile =~ /^\s*\\input \s*(\S+).tex/i) {
    my $include = $path.$1;
    chomp($include);
    print "%%%%%%%%%%% Springe nach ", $include, "\n";
    p_inc($include);
	} else 
	{
	print $zeile; 
	}
}
close $fh;
