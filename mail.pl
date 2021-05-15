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

# unique_sorted_emails.txt is a line separated list of email addresses created by the merge_purge_sort.pl script in this repository
# Change file name directly below to "unique_sorted_emails.txt" once tested, proofread and critiqued. 
# View the test_example_file.txt which is part of this repository to see the format of the address file and for use in testing your mailing
open(FILE, "test_example_file.txt") || die "can't find file: $!\n";


while (<FILE>) {

	my $msg = MIME::Lite->new(
	Subject    => "Email Subject Line Here",
	From       => '"Someone H. Doe"<someone@example.com>',
	To         => ($_),
	Type       => 'text/html',
	Data       => qq{$body}
	);

	++$i;
	
	# If the record number is under 1000, send an email else exit.
	if ($i < 1000)
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
