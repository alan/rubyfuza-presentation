!SLIDE code smaller
###[rack-maintenance](https://github.com/adamwiggins/rack-maintenance) by adamwiggins @ github
    @@@ ruby
		require 'lib/rack/maintenance'
		use Rack::Maintenance, [503,{'Content-Type'=>'text/html'}, 
								File.read('public/maintenance.html')]

		module Rack
		  class Maintenance
		    DEFAULT_RESPONSE = [
		      422,
		      { "Content-Type" => "text/html" },
		      "<html><body><h2>We are undergoing maintenance right now, please try again later.</h2></body></html>"
		    ]

		    def initialize(app, maintenance_response=DEFAULT_RESPONSE)
		      @app = app
		      @maintenance_response = maintenance_response
		    end

		    def call(env)
		      if ENV['MAINTENANCE'] == 'on'
		        @maintenance_response
		      else
		        @app.call(env)
		      end
		    end
		  end
		end
