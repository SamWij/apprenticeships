
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/contact' do
  erb :contact
end

# new user
get '/new' do
  erb :new
end


get '/profile' do

  erb :profile
end
