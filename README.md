# Ithumb::XS

[![Build Status](https://travis-ci.com/ChaoticEvil/p5-ithumb-xs.svg?branch=master)](https://travis-ci.com/ChaoticEvil/p5-ithumb-xs)

Ithumb::XS - is a small (one function), simple and fast Perl-XS module
for creation a thumbnails (with resizing and cropping), using Imlib2 library.

## Dependences & requires

This module requires these other modules and libraries:

  Imlib2 (binary and headers)

Required Perl >= v5.24.0

## Installation

### MacOS prepare installation

```
$ brew cask install xquartz
$ brew install imlib2
```

### Manual installation

To manual install this module type the following:

```
$ perl Makefile.PL
$ make
$ make test
$ make install
```

To automatical install this module type the following:

```
$ cpan -i Ithumb::XS
```

## Usage

### From shell (as one-liner)

```
$ perl -MIthumb::XS -e \
    "Ithumb::XS::create_thumbnail({width => 800, height => 600, src => '1.jpg', dst => '2.jpg'})"
```

### From perl code

```perl
use Ithumb::XS ();

Ithumb::XS::create_thumbnail({
    width  => 800,
    height => 600,
    src    => 'src_image.jpg',
    dst    => 'dst_image.jpg',
});
```

## CopyRight and license

BSD 3-Clause License

Copyright (c) 2018-2020 Peter P. Neuromantic <p.brovchenko@protonmail.com>
All rights reserved.

See LICENSE file for more information.
