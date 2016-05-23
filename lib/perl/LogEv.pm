package LogEv;

use strict;
use warnings;

use Try::Tiny;
use File::Tail;
use Getopt::Long;


sub WatchLog()
{
    my $options = {};
    GetOptions("log_name=s" => \$$options{log_name}) or die("Error in command line arguments\n"); 
    
    if(!defined $$options{log_name})
    {
        die();
    }
}


sub FilterLog($)
{
    my ($options) = @_;
    
    !defined $options ? die("System error!", '001') : 1;
    my $file = File::Tail->new(name=>$$options{log_name}, maxinterval=>3, adjustafter=>7);
    while (defined(my $line = $file->read)) 
    {
        print "$line";
    }

}

1;
