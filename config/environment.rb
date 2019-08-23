ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

# configure :development do
#   set :database, 'sqlite3:db/database.db'
# end

if ENV['SINATRA_ENV'] == 'development'
  require_relative '../secrets.rb'
end


require_relative '../constants'
require_relative './initializers/date_format'

## changes timezone to local, instead of UTC
ActiveRecord::Base.default_timezone = :local

require_all 'app'