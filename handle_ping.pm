#!/usr/bin/perl -w
# this module requires the handler module.
use warnings;
use strict;
handler::register('ping',sub{my $ping=(split(' ',shift))[1];senddata('PONG '.$ping)});
1;
