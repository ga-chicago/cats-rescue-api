class CatsController < Sinatra::Base

  require 'bundler'
  Bundler.require

  get '/' do
    {:message => 'it is working'}.to_json
  end

end