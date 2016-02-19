use IO::Socket::INET;

$socket = new IO::Socket::INET (
    LocalPort => '3901',
    Proto => 'udp'
);
die "cannot create socket $!\n" unless $socket;
print "server waiting for client connection on port 3901\n";

while ($socket->recv($data, 1024)) {
    print "Pinger said $data\n";
    sleep(1);
    $socket->send("$data");
    print "I said $data\n";
}

 END {
    $socket->close();
 }
