
require 'sinatra'
require 'sinatra/reloader'
require_relative 'database_config'
require_relative 'models/apprentice_profile'
require_relative 'models/education'
require_relative 'models/employer_profile'
require_relative 'models/industry'
require_relative 'models/license'
require_relative 'models/referee'
require_relative 'models/user_type'
require_relative 'models/work_experience'

enable :sessions

helpers do

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in? #should return true or false
    # current_user! nil  #will return a true or false - generally wrapped in an if statement.
    !!current_user
  end

  
end

after do
  ActiveRecord::Base.connection.close
end


get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/contact' do
  erb :contact
end

# new apprentice
get '/new_apprentice' do
  erb :new_apprentice
end



post '/view_apprentice' do
  newUser = ApprenticeProfile.new
  newUser.firstname = params[:firstname]
  newUser.surname = params[:surname]
  newUser.email = params[:email]
  newUser.user_type_id = 1
  newUser.state = params[:state]
  newUser.postcode = params[:postcode]
  newUser.password = params[:password]
  newUser.industry_id = 1;
  newUser.profile_comp = "false"
  newUser.save

  if newUser.save
    redirect '/view_apprentice'
    else
      erb :index
  end
end
get '/view_apprentice' do


  erb :view_apprentice
end
# new employer
get '/new_employer' do
  erb :new_employer
end

#employer login
get '/employer_login' do
  erb :employer_login
end



post '/session' do

  user = ApprenticeProfile.find_by(email: params[:email])
  if user && ApprenticeProfile.authenticate(params[:password])
    #you are authnticated and let me create a session for you.
    session[:user_id]  = user.id
    redirect '/view_apprentice'
  else
    # you are not authenticated.
    erb :index
  end
end

delete '/session' do
  session[:user_id] = nil

  redirect '/session/new'

end
