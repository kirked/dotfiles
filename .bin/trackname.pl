#!/usr/bin/env perl

use strict;
use warnings;

my $testing = shift if $ARGV[0] eq "-t";
my $dir = shift || die "specify directory\n";
my $discnum = shift || "1";
my $remove = quotemeta(shift || "^^^");
my $pat = qr($remove) if $remove;

opendir(DIR, $dir) or die $!;
while (my $file = readdir(DIR)) {
  if ($file =~ m/^\(?(\d+)[) .-]+(.+)\.(flac|wma)$/) {
    next if $file =~ m/^\d\.\d{2}-/;
    my $track = sprintf("%02d", $1);
    my $name = $2;
    my $ext = $3;
    my $newname = "$discnum.$track-$name";
    if ($pat) {
      $newname =~ s/$pat//;
    }
    $newname =~ s/^\s+|\s+$//g;
    $newname = "$newname.$ext";
    printf("Rename %-50s to %s\n", $file, $newname);
    rename "$dir/$file", "$dir/$newname" if !$testing;
  }
  elsif ($file =~ m/$pat/) {
    my $newname = $file;
    $newname =~ s/$pat//;
    $newname =~ s/^\s+|\s+$//g;
    printf("Rename %-50s to %s\n", $file, $newname);
    rename "$dir/$file", "$dir/$newname" if !$testing;
  }
}

