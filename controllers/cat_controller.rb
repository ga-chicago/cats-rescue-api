class CatsController < Sinatra::Base

  require 'bundler'
  Bundler.require

  ActiveRecord::Base.establish_connection(
      :adapter => 'mysql2',
      :database => 'cats_rescue'
  )

  require 'sinatra'
  require 'sinatra/cross_origin'

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
    @model = Cat.find(params[:id])
    @model.destroy
    {:message => 'Your cat with an id of ' + params[:id] + ' was adopted :)'}.to_json
  end

end