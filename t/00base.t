#!/usr/bin/env perl

use strict;
use warnings;

use Test::More 'no_plan';
BEGIN { use_ok('Ithumb::XS') };


# Source image have dimension 5x3 px.
use constant IMG_SRC => 't/src.png';
use constant IMG_OUT => 't/src_thumb.png';

can_ok('Ithumb::XS', 'create_thumbnail');

eval {
    Ithumb::XS::create_thumbnail({width => -2, height => 2, src => IMG_SRC, dst => IMG_OUT});
} or do {
    like($@, qr/invalid value of width/i, 'check with invalid width');
};

eval {
    Ithumb::XS::create_thumbnail({width => 2, height => -2, src => IMG_SRC, dst => IMG_OUT});
} or do {
    like($@, qr/invalid value of height/i, 'check with invalid height');
};

eval {
    Ithumb::XS::create_thumbnail({width => 2, height => 2, src => 'invalid_file.png', dst => IMG_OUT});
} or do {
    like($@, qr/file does not exist/i, 'check not exists file');
};

eval {
    Ithumb::XS::create_thumbnail({width => 2, height => 2, src => 'invalid_file.png', dst => ''});
} or do {
    like($@, qr/parameter is required/i, 'dst is required');
};

done_testing();
