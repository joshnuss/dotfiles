require 'bundler/setup'
require 'sinatra'
require 'sass'
require 'bourbon'

get '/' do
  haml :index
end

get '/js/app.js' do
  coffee :app
end

get '/css/:name.css' do |name|
  scss "scss/#{name}".to_sym
end
