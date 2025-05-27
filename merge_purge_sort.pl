#!/usr/bin/env perl

# File name: merge_purge_sort.pl
# Procedure and Script to merge email address files and purge duplicate records resulting in one sorted file with unique email addresses.
# By Joel Rader  echophotographic@gmail.com

# Usage is as follows...

# Create a single concatenated file of all your email address files by running the cat command on your line separated email files...
# Merge address files and name the concatenated and redirected file "cat.txt" as shown below
# $ cat emailfile1.txt emailfile2.txt emailfile3.txt > cat.txt 

# Run the Perl script as follows to purge duplicate addresses and get a file of sorted and unique email addresses
# $ ./merge_purge_sort.pl > unique_sorted_emails.txt

# This script was written for line separated email address files with only the email address and not the person's name as part of each record.
# Please write me if more functionality is needed.

use warnings;
use strict;
use diagnostics;

# Have perl open the merged "cat.txt" file as described above
open(FILE, "cat.txt") or die "can\'t find file: $!\n";

my @array;
while (<FILE>)
{
	# Convert email addresses to lowercase and add email addresses to an array
	push(@array, "\L$_");
}

close FILE;

my %unique = ();

foreach my $item (@array)
{
	# Populate hash
	$unique{$item} ++;
}

# Get array of unique email addresses
my @unique_array = keys %unique;

# Sort unique email addresses
@unique_array = sort(@unique_array);

print @unique_array;
