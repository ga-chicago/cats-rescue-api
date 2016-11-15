require 'sinatra/base'

# controllers
require './controllers/application_controller'
require './controllers/cat_controller'
require './controllers/dog_controller'
# model
require './models/cat'
require './models/dog'
# map routes
map('/api/cats') { run CatsController }
map('/api/dogs') { run DogsController }