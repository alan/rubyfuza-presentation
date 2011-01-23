!SLIDE
## Rack::Mount
    @@@ ruby
    RackApp = proc{|env| [200,
                {'Content-Type' => 'text/plain'},
                 'Dit is oor rack'
               ]}
    
    Routes = Rack::Mount::RouteSet.new do |set|
      set.add_route RackApp, { :request_method => 'GET', 
              :path_info => %r{^/rack$} }, 
              {}, :rack
    end
    
    run Routes
	Routes.generate(:path_info, :rack) 
	#=> "/rack" 