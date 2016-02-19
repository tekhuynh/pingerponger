use IO::Socket::INET;

$host = $ARGV[0];
$host or die "need host address";

$socket = new IO::Socket::INET (
    PeerHost => $host,
    PeerPort => '3901',
    Proto => 'udp',
);
die "cannot connect to the server $!\n" unless $socket;
print "connected to the server\n";

$data = 'a';

while(1) {
    $socket->send($data) or die "send: $!";
    print "I said $data\n";
    $res = $socket->recv($data, 1024);
    print "Ponger said $data\n";
    sleep(1);
}

END {
    $socket->close();
}
