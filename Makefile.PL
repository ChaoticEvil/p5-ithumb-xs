use 5.024000;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Ithumb::XS',
    ABSTRACT_FROM     => 'lib/Ithumb/XS.pm',
    VERSION_FROM      => 'lib/Ithumb/XS.pm',
    MIN_PERL_VERSION  => '5.24.0',
    PREREQ_PM         => {'XSLoader' => 0,},
    AUTHOR            => 'Peter P. Neuromantic <p.brovchenko@protonmail.com>',
    LICENSE           => 'bsd',
    LIBS              => ['-lImlib2'],
    DEFINE            => '',
    INC               => '-I/usr/include -I/usr/X11/include/',
    CCFLAGS           => '-Wall -Wextra -Werror -std=c11',
    OPTIMIZE          => '-O3',
    META_MERGE        => {
        'meta-spec' => {
            version => 2
        },
        resources   => {
            bugtracker => {
                web => 'https://github.com/ChaoticEvil/p5-ithumb-xs/issues'
            },
            repository => {
                type => 'git',
                url  => 'https://github.com/ChaoticEvil/p5-ithumb-xs.git',
                web  => 'https://github.com/ChaoticEvil/p5-ithumb-xs',
            },
        },
    },
);
