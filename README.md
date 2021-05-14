# Perl-Email-Tools

## merge_purge_sort.pl

Procedure and Script to merge email address files and purge duplicate records resulting in one sorted file with unique email addresses.

Create a single concatenated file of all your email address files by running the cat command on your line separated email files...
Merge address files and name the concatenated and redirected file "cat.txt" as shown below
    
    $ cat emailfile1.txt emailfile2.txt emailfile3.txt > cat.txt 

Run the Perl script as follows to purge duplicate addresses and get a file of sorted and unique email addresses
    
    $ ./merge_purge_sort.pl > unique_sorted_emails.txt

This script was written for line separated email address files with only the email address and not the person's name as part of each record.

Please write me if more functionality is needed.

## mail.pl

You will need a working SMTP server and Perl installed for this script to run

Timing of this script clocked-in at sending ~10 emails per second or ~36000 emails per hour on modest hardware.  Probably enough horsepower for mid size email lists.

You may need to install MIME::Lite Perl module

To Install MIME::Lite Perl module...

    $ cpan -i MIME::Lite    
Or

    $ cpanm MIME::Lite

This script runs in the same folder as the unique_sorted_emails.txt file described above in the merge_purge_sort.pl instructions.

I do some test mailings with an address text file that has ony a few email addresses before I run the script on the "big" list to check for any errors or text changes

To run the script verify the file unique_sorted_emails.txt is referenced in mail.pl and is run in the same directory as the list.

    $ ./mail.pl
