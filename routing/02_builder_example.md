!SLIDE code
#Rack::Builder
    @@@ ruby
		app = Rack::Builder.new {
		  use Rack::CommonLogger
		  use Rack::ShowExceptions
		  map "/lobster" do
		    use Rack::Lint
		    run Rack::Lobster.new
		  end

		  map "/hello" do
		    run lambda{|env|
		      [200, {'Content-Type' => 'text/plain'}, "Hello World"]
		      }
		  end
		}
		run app
