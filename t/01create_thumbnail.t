#!/usr/bin/env perl

use strict;
use warnings;

use Test::More 'no_plan';

use Ithumb::XS;

# Source image have dimension 5x3 px.
use constant IMG_SRC => 't/src.png';
use constant IMG_OUT => 't/src_thumb.png';

ok(
    Ithumb::XS::create_thumbnail({width => 2, height => 2, src => IMG_SRC, dst => IMG_OUT}),
    "create_thumbnail()"
);

unlink IMG_OUT if -f IMG_OUT;

done_testing();
