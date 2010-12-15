#!/usr/bin/perl -w
use warnings;
use strict;
package handler;
my %handle;
sub handle {
  my $data = shift;
  my @s = split(' ',$data);
  $data =~ s/\s+$//;
  $data =~ s/^\s+$//;
  print "handle: $data\n";
  foreach (keys %handle) {
    if ($handle{$_}{'name'} eq lc($s[1])) {
      $handle{$_}{'sub'}($data,@s);
    }
    if ($handle{$_}{'name'} eq lc($s[0])) {
      $handle{$_}{'sub'}($data,@s);
    }
  }
}
sub register {
  my $handler = shift;
  my $id = $handler.rand;
  $handle{$id} = {
    'name' => $handler,
    'sub' => shift,
    'time' => time
  };
  print "Handler registered: $id\n";
}
1;
