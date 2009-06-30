package Convert::AnyBase;

use warnings;
use strict;

=head1 NAME

Convert::AnyBase -

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

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
            normalize => sub { s/[oO]/0/g; s/[iIlL]/1/g; $_ },
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
