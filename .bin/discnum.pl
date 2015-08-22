#!/usr/bin/env perl

use strict;
use warnings;

my $testing = shift if $ARGV[0] eq "-t";
my $dir = shift or die "specify directory\n";
my $remove = quotemeta(shift or "");
my $pat = qr($remove) if $remove;

opendir(DIR, $dir) or die $!;
while (my $file = readdir(DIR)) {
  if ($file =~ m/^(\d+)(?:\.|-)(\d+)[ -]+(.+)\.flac$/) {
    my $disc = $1 + 0;
    my $track = sprintf("%02d", $2);
    my $name = $3;
    my $newname = "$disc.$track-$name";
    if ($pat) {
      $newname =~ s/$pat//;
    }
    $newname =~ s/^\s+|\s+$//g;
    $newname = "$newname.flac";
    printf("Rename %-50s to %s\n", $file, $newname);
    rename "$dir/$file", "$dir/$newname" if !$testing;
  }
}
