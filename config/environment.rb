ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'rack-flash'
Bundler.require(:default, ENV['SINATRA_ENV'])

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "shorten_db_development"
)

require_all 'app'
