package Authen::Simple::IMAP;

use warnings;
use strict;
use base 'Authen::Simple::Adapter';

use Mail::IMAPClient;
use Params::Validate qw[];

our $VERSION = 0.1;

__PACKAGE__->options(
    {   host => {
            type     => Params::Validate::SCALAR,
            default  => 'localhost',
            optional => 1
        }
    }
);

sub check {
    my ( $self, $username, $password ) = @_;

    my $host = $self->host;
    my $imap;

    eval {
        $imap = Mail::IMAPClient->new(
            Server   => $host,
            User     => $username,
            Password => $password,
        ) or die "$@";
    };

    ( my $error = $@ ) ? return 0 : return 1;
}

1;

__END__

=head1 NAME

Authen::Simple::IMAP - Simple IMAP authentication

=head1 SYNOPSIS

    use Authen::Simple::IMAP;
    
    my $imap = Authen::Simple::IMAP->new(
        host => 'host.company.com'
    );
    
    if ( $imap->authenticate( $username, $password ) ) {
        # successfull authentication
    }
    

=head1 DESCRIPTION

IMAP authentication.

=head1 METHODS

=over 4

=item * new

This method takes a hash of parameters. The following options are
valid:

=over 8

=item * host

Connection host, can be a hostname or IP address. Defaults to C<localhost>.

    host => 'ldap.company.com'
    host => '10.0.0.1'


=item * authenticate( $username, $password )

Returns true on success and false on failure.

=back

=head1 SEE ALSO

L<Authen::Simple>.

L<Mail::IMAPClient>.

=head1 AUTHOR

Andre Osti de Moura <andreoandre [at] gmail [dot] com>

=head1 COPYRIGHT

This program is free software, you can redistribute it and/or modify 
it under the same terms as Perl itself.

=cut

