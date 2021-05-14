#!/usr/bin/env perl

# File Name: mail.pl 
# Perl Script to Send Multiple Emails from List of Addresses
# By Joel Rader  info[at]JoelRader[dot]net

use warnings;
use strict;
use diagnostics;

# Install MIME::Lite Perl module...
# Use $ cpan -i MIME::Lite    
# Or  $ cpanm MIME::Lite

use MIME::Lite;

my $body = '

<div style="font-size:large; font-family:Cambria;">

Dear Friends,

<br><br>

Enter email body text here between apostrophes.

</div>

';

my $i = 0;

# The file "emailList.txt" referenced below is a list of your line separated email addresses.
# See  https://joelrader.net/cgi-bin/sort/pretty.pl... a merge, purge and sort procedure and script to remove duplicate email addresses and sort your address list(s).
# This file only has email addresses, one per line, and has not been tested with the given name as part of the address
# Write to me if you require more functionality - info[at]joelrader[dot]net
open(FILE, "emailList.txt") || die "can't find file: $!\n";


while (<FILE>) {

	my $msg = MIME::Lite->new(
	Subject    => "Email Subject Line Here",
	From       => '"Someone H. Doe"<someone@example.com>',
	To         => ($_),
	Type       => 'text/html',
	Data       => qq{$body}
	);

	++$i;
	
	# If the record number is under 500, send an email else exit.
	if ($i < 500)
	{
		print $i . " ";
		print $_;
		# You will need a working SMTP server to send email
		# I use Postfix for SMTP
		$msg->send('smtp','localhost', Timeout=>20) || die "cant send to: $_ : $!\n";
	
	}
	else
	{
		close FILE;
		exit;
	}
}

close FILE;
