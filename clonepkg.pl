#!/usr/bin/perl
use strict;
use warnings;
use 5.022;
while (defined(my $pkg = shift(@ARGV)))
{
    chomp($pkg);
    system("git", "clone", "https://aur.archlinux.org/$pkg.git");
}
