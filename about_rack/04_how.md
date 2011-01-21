!SLIDE
# How
### A Rack application is an Ruby object (not a class) that responds to call. 
### It takes exactly one argument, the environment and returns an Array of exactly three values: The status, the headers, and the body.

    @@@ ruby

		app = lambda{|env| 
			[200, 
			{"Content-Type" => 'text/plain'}, 
			'Hello World']
			}
