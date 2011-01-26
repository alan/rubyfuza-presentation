# require "chronic"
require "bundler/setup"
require "wackamole"
require "showoff"
# require "rackamole"

# rubyfuza = Rack::Builder.app {
#   use Rack::CommonLogger
#   use Rack::ShowExceptions
#   if ENV['RACK_ENV'] == 'production'
# 
#     config_path = File.expand_path(File.join(File.dirname(__FILE__), 'zones.yml.erb'))
#     host = ENV['MONGO_HOST']
#     port = ENV['MONGO_PORT']
#     @@options={:protocol=>"mongo", :host=>host, :port=>port, 
#                :db_name=>"mole_rubyfuza_production_mdb", :cltn_name=>"rack_sessions", :config_path => config_path,
#                :user => ENV['MONGO_USER'], :password => ENV['MONGO_PASS']}
#     require File.join(Wackamole.path, %w(lib app.rb))
# 
#     use Rack::Mole, :app_name => 'rubyfuza', 
#                     :store => Rackamole::Store::MongoDb.new(:db_name => 'mole_rubyfuza_production_mdb',
#                                                             :host => ENV['MONGO_HOST'],
#                                                             :port => ENV['MONGO_PORT'],
#                                                             :username => ENV['MONGO_USER'],
#                                                             :password => ENV['MONGO_PASS'])
#     # map "/" do
#     #   map "/wackamole" do
#     #     run Sinatra::Application
#     #   end
#     # 
#     #   run ShowOff.new
#     run ShowOff.new
#   else
#     map "/" do
#       run ShowOff.new
#     end
#   end
# }

run Rack::Builder.app {run Cascade.new([ShowOff.new])}
