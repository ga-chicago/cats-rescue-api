require 'sinatra/base'

# controllers
require './controllers/cat_controller'
# model
require './models/cat'
# map routes
map('/api/cats') { run CatsController }