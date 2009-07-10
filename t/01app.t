use Test::More tests => 4;

BEGIN { use_ok ('Authen::Simple::IMAP'); }

require_ok( 'Mail::IMAPClient' );
require_ok ( 'Authen::Simple::Adapter' );
require_ok ( 'Params::Validate' );
