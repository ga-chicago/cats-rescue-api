class CatsController < Sinatra::Base

  require 'bundler'
  Bundler.require

  ActiveRecord::Base.establish_connection(
      :adapter => 'mysql2',
      :database => 'cats_rescue'
  )

  get '/' do
    {:message => 'it is working'}.to_json
  end

end