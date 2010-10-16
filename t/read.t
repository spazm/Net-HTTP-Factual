use Test::More;
use strict;
use warnings;

use_ok('Net::HTTP::Factual');
my $factual = Net::HTTP::Factual->new();

my $output = $factual->client->read(
    api_key => 'S8bAIJhnEnVp05BmMBNeI17Kz3waDgRYU4ykpKU2MVZAMydjiuy88yi1vhBxGsZC',
    table_id => 'EZ21ij',
);

is( $output->status, 200 );
is( ref $output->body, 'HASH' );
is( ref $output->body->{response}->{data}, 'ARRAY', 'json decoded body to array' );
is( @{$output->body->{response}->{data}}, 20, '20 items in array' );

my ( $status, $headers, $data ) = @$output;
diag explain $status;
diag explain $headers;
diag explain $data;

done_testing;
