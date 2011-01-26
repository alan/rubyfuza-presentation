require "chronic"
require "bundler/setup"

task :default do
  require 'wackamole'
  config_path = File.expand_path(File.join(File.dirname(__FILE__), 'zones.yml.erb'))
  host = ENV['MONGO_HOST']
  port = ENV['MONGO_PORT']
  @@options={:protocol=>"mongo", :host=>host, :port=>port, 
             :db_name=>"mole_rubyfuza_production_mdb", :cltn_name=>"rack_sessions", :config_path => config_path}
  require File.join(Wackamole.path, %w(lib app.rb))
  Wackamole::Control.init_config(config_path)
  Wackamole::Control.ensure_indexes!
end