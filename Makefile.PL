use inc::Module::Install;

name     'Convert-AnyBase';
all_from 'lib/Convert/AnyBase.pm';
author   'Robert Krimen <rkrimen@cpan.org>';
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

