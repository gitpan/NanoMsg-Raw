use strict;
use warnings;

package NanoMsg::Raw::Message;
BEGIN {
  $NanoMsg::Raw::Message::AUTHORITY = 'cpan:FLORA';
}
{
  $NanoMsg::Raw::Message::VERSION = '0.02';
}
# ABSTRACT: Message buffer for NanoMsg::Raw

use overload '""' => sub { ${ $_[0] } }, fallback => 1;


1;

__END__

=pod

=encoding utf-8

=head1 NAME

NanoMsg::Raw::Message - Message buffer for NanoMsg::Raw

=head1 SYNOPSIS

    use NanoMsg::Raw;

    {
        my $msg = nn_allocmsg(3, 0);
        $msg->copy('foo');
        nn_send($sock, $msg);
    }

    {
        nn_recv($sock, my $buf);
        warn $buf;
    }

=head1 DESCRIPTION

Instances of this class represent a message buffer allocated by nanomsg. New
empty buffers can be allocated using C<nn_allocmsg>. Both C<nn_recv> and
C<nn_recvmsg> can be used to allocate buffers initialised with the contents of a
received message.

C<NanoMsg::Raw::Message>s can be used to send and receive data in a zero-copy
fashion.

When using a message instance as a string, its overloading will produce a string
containing a copy of the buffer content.

A string pointing to the actual buffer content, without having to create a copy
of it, can be obtained by dereferencing the message instance as a scalar.

=head1 METHODS

=head2 copy($data)

    $msg->copy('foo');

Copies C<$data> to the beginning of the buffer. If the data is larger than the
space allocated for the buffer, an exception will be thrown.

=head1 SEE ALSO

L<NanoMsg::Raw>

=head1 AUTHORS

=over 4

=item *

Florian Ragwitz <rafl@debian.org>

=item *

Boris Zentner <bzm@2bz.de>

=back

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2013 by Florian Ragwitz.

This is free software, licensed under:

  The MIT (X11) License

=cut
