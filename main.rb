require 'pry'
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
require_relative 'models/state'

enable :sessions

helpers do

  def current_user
    ApprenticeProfile.find_by(id: session[:user_id])
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

get '/contact/new' do
  erb :contact
end

post '/contact' do
  erb :index
end

# new apprentice
get '/apprentice/new' do
  @industries = Industry.all
  @states = State.all
  @apprentice = ApprenticeProfile.all
  erb :apprentice
end

#create new apprentice
post '/apprentice' do
  newUser = ApprenticeProfile.new
  newUser.firstname = params[:firstname]
  newUser.surname = params[:surname]
  newUser.email = params[:email]
  newUser.email = params[:mobile]
  newUser.user_type_id = 1
  newUser.state_id = params[:state]
  newUser.postcode = params[:postcode]
  newUser.password = params[:password]
  newUser.industry_id = params[:industry_selected]
  newUser.profile_comp = "false"
  newUser.save

  if newUser.save
    redirect '/view_apprentice'
    else
      erb :index
  end
end
get '/apprentice_cv' do
  @user = ApprenticeProfile.find(session[:id])
  erb :apprentice_cv
end
#display apprentice profile
get '/apprentice/:id' do
  @user = ApprenticeProfile.find(session[:id])
  erb :view_apprentice
end

#edit apprentice profile
get '/apprentice/:id/edit' do
  erb :edit_apprentice
end

#update apprentice profile
put '/apprentice/:id' do

end

get '/view_apprentice' do
  @apprentice = ApprenticeProfile.find(session[:id])
  erb :view_apprentice
end

#delete apprentice
delete '/apprentice/:id' do

end

# new employer
get '/new_employer' do
  @industries = Industry.all
  @states = State.all
  erb :new_employer
end

post '/view_employer' do
  newEmp = EmployerProfile.new
  newEmp.industry_id = params[:industry_selected]
  newEmp.user_type_id = 2
  newEmp.firstname = params[:firstname]
  newEmp.surname = params[:surname]
  newEmp.company_name = params[:company]
  newEmp.website_link = params[:web]
  newEmp.business_email = params[:email]
  newEmp.company_number = params[:number]
  newEmp.state_id = params[:state]
  newEmp.postcode = params[:postcode]
  newEmp.password = params[:password]
  newEmp.save
end

#employer login
get '/employer_login' do
  erb :employer_login
end

get '/view_employer' do
  erb :view_employer
end


post '/session' do
  e_user = EmployerProfile.find_by(business_email: params[:email])
  a_user = ApprenticeProfile.find_by(email: params[:email])

  if a_user && a_user.authenticate(params[:password])
    #you are authnticated and let me create a session for you.
    session[:id]  = a_user.id
    redirect '/view_apprentice'
  elsif e_user && e_user.authenticate(params[:password])
    #you are authnticated and let me create a session for you.
    session[:id]  = e_user.id
    redirect '/view_employer'
  else
    # you are not authenticated.
    erb :index
  end
end

get '/session/new' do
  erb :index
end

delete '/session' do
  session[:d] = nil

  redirect '/session/new'

end
