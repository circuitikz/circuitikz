#!/usr/bin/perl -w

# Usage:
# buildFile.pl main-file.tex > main-file_flat.tex
#     
sub p_inc {
  $DateiName = shift;
    if ( open (my $datei, "$DateiName.tex") ) {
      print "%%%---------- open: ", $DateiName, "\n";
      while (<$datei>) {
        if (/^\s*\\input \s+(\S+)/i) {
          my $include = $1;
          chomp($include);chop($include);
          print "%%%%%%%%% Springe nach ", $include, "\n";
          p_inc($include);
        } else
		{ 
		print unless(/^\s*(#|$)/); 
		}
      }
      print "%%%---------- close: ", $DateiName, "\n";
      close $datei;
    } else { print "%%%<===== Datei existiert nicht\n"; }
}



my $filename = shift @ARGV;
my ($path,$file) = $filename =~ m|^(.*[/\\])([^/\\]+?)$|;

   open (DATEI, $filename) or die $!;
@zeilen = <DATEI>;
for $zeile (@zeilen) {
 # next if $zeile =~ /^\s$/;
 # next if $zeile =~ /^\s*(%)/;
  if ($zeile =~ /^\s*\\input \s*(\S+).tex/i) {
    my $include = $path.$1;
    chomp($include);
    print "%%%%%%%%%%% Springe nach ", $include, "\n";
    p_inc($include);
  } else 
{ print $zeile; }
}

