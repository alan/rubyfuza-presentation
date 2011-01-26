!SLIDE
## Example from README
	@@@ javascript
	var connect = require('connect');
	var nack    = require('nack');

	connect.createServer(
	  connect.logger(),
	  connect.vhost('foo.test',
	    nack.createServer("/apps/foo/config.ru")
	  ),
	  connect.vhost('bar.test',
	    nack.createServer("/apps/bar/config.ru")
	  )
	).listen(3000);