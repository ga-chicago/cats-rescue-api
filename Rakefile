require 'zlib'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

ActiveRecord::Base.establish_connection(
  :adapter  => ENV['adapter']
  :host     => ENV['host'],
  :username => ENV['user'],
  :password => ENV['password'],
  :database => ENV['database']
)
