# Adapted from https://github.com/adamwiggins/rack-maintenance/blob/master/example/config.ru

# rackup maintenance.ru => No maintenance
# MAINTENANCE=on rackup maintenance.ru => On maintenance

#\ -w -p 8765

require 'maintenance'

use Rack::Maintenance, [503, {'Content-Type'=>'text/plain'}, StringIO.new("Maintenance mode on!\n")]

app = lambda{|env| [200, {"Content-Type" => 'text/plain'}, 'Hello World']}

run app