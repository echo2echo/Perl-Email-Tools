# Perl-Email-Tools

## merge_purge_sort.pl

This is a procedure and script to merge email address files and purge duplicate records resulting in one sorted file with unique email addresses.

Make sure your email list(s) have only one address per line with no given name, only email address and no blank lines. Do a visual inspection of your lists and see if they look ready for use.
Next, create a single concatenated file of all your email address files by running the cat command on your line separated email files...
Merge address files and name the concatenated and redirected file "cat.txt" as shown below
    
    $ cat emailfile1.txt emailfile2.txt emailfile3.txt > cat.txt 

Grant permission to run script

    $ sudo chmod 755 merge_purge_sort.pl

Run the Perl script as follows to purge duplicate addresses and get a file of sorted and unique email addresses
    
    $ ./merge_purge_sort.pl > unique_sorted_emails.txt

This script was written for line separated email address files with only the email address and not the person's name as part of each record.

## mail.pl

You will need a working SMTP server and Perl installed for this script to run

Timing of this script clocked-in at sending over ~10 emails per second or the equivalent of ~36,000 emails per hour on modest hardware and network speeds.  Probably enough horsepower for mid size email lists.

You may need to install the MIME::Lite Perl module

To Install MIME::Lite Perl module...

    $ cpan -i MIME::Lite    
Or

    $ cpanm MIME::Lite
    
Or if these don't work try apt install on Ubuntu/Debian Linux

    $ sudo apt install libmime-lite-perl

This script runs in the same folder as the unique_sorted_emails.txt file described above in the merge_purge_sort.pl instructions.

### I do some test mailings with an address text file that has a few of my own email addresses before I run the script on the "big" list to check for any errors and to see if it looks good enough to send.  Once it looks good, replace your test file with the unique_sorted_emails.txt or your own production ready file

Make changes to the test_example_file.txt file to test with your own email addresses.

Grant permission to run mail.pl file

    $ sudo chmod 755 mail.pl
 
To run the script with your sorted and unique address file verify the file unique_sorted_emails.txt, or your production ready email list, is referenced in mail.pl and is run in the same directory as the list.

    $ ./mail.pl
