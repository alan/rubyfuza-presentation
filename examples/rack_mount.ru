#\ -w -p 8765

require 'rack/mount'

RackApp = proc{|env| [200,
                       {'Content-Type' => 'text/plain'},
                        'Dit is oor rack'
                      ]}

Routes = Rack::Mount::RouteSet.new do |set|
  set.add_route RackApp, { :request_method => 'GET', :path_info => %r{^/rack$} }, {}, :rack
end

use Rack::CommonLogger
use Rack::ShowExceptions
run Routes