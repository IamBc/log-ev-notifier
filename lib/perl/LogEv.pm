package LogEv;

use strict;
use warnings;

use Try::Tiny;
use File::Tail;
use Getopt::Long;



sub WatchLog()
{
    my $options = GetConfig();
    !defined $options ? die("System error!") : 1;
    
    if(!defined $$options{log_name})
    {
        die();
    }

}


sub GetConfig()
{
    my $options = {};
    GetOptions("log_name=s" => \$$options{log_name}) or die("Error in command line arguments\n"); 
    return $options;
}

1;
