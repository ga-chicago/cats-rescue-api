class CatsController < Sinatra::Base

  require 'bundler'
  Bundler.require

  register Sinatra::CrossOrigin

  ActiveRecord::Base.establish_connection(
      :adapter => 'mysql2',
      :database => 'cats_rescue'
  )

  require 'sinatra'
  require 'sinatra/cross_origin'

  set :allow_origin, :any
  set :allow_methods, [:get, :post, :patch, :delete]

  options "*" do
    response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    200
  end

  configure do
    enable :cross_origin
  end

  get '/' do
    @model = Cat.all
    @model.to_json
  end

  get '/:id' do
    @model = Cat.find(params[:id])
    @model.to_json
  end

  post '/' do
    @model = Cat.new
    @model.name = params[:name]
    @model.note = params[:note]
    @model.image = params[:image]
    @model.save
    @model.to_json
  end

  patch '/:id' do
    @model = Cat.find(params[:id])
    @model.name = params[:name]
    @model.note = params[:note]
    @model.image = params[:image]
    @model.save
    @model.to_json
  end

  delete '/:id' do
    #binding.pry
    @model = Cat.find(params[:id])
    @model.destroy
    {:message => 'Your cat with an id of ' + params[:id] + ' was adopted :)'}.to_json
  end

end