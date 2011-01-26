require "showoff"
require "rackamole"

if ENV['RACK_ENV'] == 'production'
  use Rack::Mole, :app_name => 'Rubyfuza Rack', 
                  :store => Rackamole::Store::MongoDb.new(:db_name => 'mole_rubyfuza_production_mdb',
                                                          :host => ENV['MONGO_HOST'],
                                                          :port => ENV['MONGO_PORT'],
                                                          :username => ENV['MONGO_USER'],
                                                          :password => ENV['MONGO_PASS'])
end
run ShowOff.new
