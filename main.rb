
require 'sinatra'
require 'sinatra/reloader'


enable :sessions

helpers do

  def current_user
    # User.find_by(id: session[:user_id])
  end

  def logged_in? #should return true or false
    # current_user! nil  #will return a true or false - generally wrapped in an if statement.
    !!current_user
  end


end

# after do
#   ActiveRecord::Base.connection.close
# end


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
