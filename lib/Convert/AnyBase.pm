package Convert::AnyBase;

use warnings;
use strict;

=head1 NAME

Convert::AnyBase - Encode/decode to and from an arbitrary base

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

    use Convert::AnyBase

    # A hex encoder/decoder
    my $hex = Convert::AnyBase->new( set => '0123456789abcdef', normalize => sub { lc } )
    $hex->encode( 10 )  # a
    $hex->encode( 100 ) # 64
    $hex->decode( 4d2 ) # 1234

    # A Crockford encoder/decoder (http://www.crockford.com/wrmg/base32.html)
    Convert::AnyBase->new( set => ( join '', 0 .. 9, 'a' .. 'h', 'j', 'k', 'm', 'n', 'p' .. 't', 'v', 'w', 'x', 'y', 'z' ),
        normalize => sub { s/[oO]/0/g; s/[iIlL]/1/g; lc }, # o, O => 0 / i, I, l, L => 1
    )

=head1 DESCRIPTION

Convert::AnyBase is a tool for converting numbers to and from arbitrary symbol sets.

=cut

sub new {
    shift;
    require Convert::AnyBase::Converter;
    return Convert::AnyBase::Converter->new( @_ );
}

{
    my ( $hex, $crockford, $decimal );
    
    sub hex {
        return $hex || __PACKAGE__->new( set => ( join '', 0 .. 9, 'a' .. 'f' ), normalize => sub { lc } );
    }
    
    sub crockford {
        return $crockford ||= __PACKAGE__->new( set => ( join '', 0 .. 9, 'a' .. 'h', 'j', 'k', 'm', 'n', 'p' .. 't', 'v', 'w', 'x', 'y', 'z' ),
            normalize => sub { s/[oO]/0/g; s/[iIlL]/1/g; lc },
        );
    }

    sub decimal {
        return $decimal ||= __PACKAGE__->new( set => ( join '', 0 .. 9, ) );
    }
}

=head1 AUTHOR

Robert Krimen, C<< <rkrimen at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-convert-anybase at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Convert-AnyBase>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Convert::AnyBase


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Convert-AnyBase>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Convert-AnyBase>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Convert-AnyBase>

=item * Search CPAN

L<http://search.cpan.org/dist/Convert-AnyBase/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Robert Krimen, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of Convert::AnyBase
