require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative 'database_config'
require_relative 'models/apprentice'
require_relative 'models/education'
require_relative 'models/industry'
require_relative 'models/license'
require_relative 'models/referee'
require_relative 'models/work_experience'
require_relative 'models/state'
require_relative 'models/work_preference'

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
  new_user = ApprenticeProfile.new

  new_user.industry_id = params[:industry_selected]
  new_user.firstname = params[:firstname]
  new_user.surname = params[:surname]
  new_user.email = params[:email]
  new_user.mobile_no = params[:mobile]
  new_user.state_id = params[:state]
  new_user.postcode = params[:postcode]
  new_user.password = params[:password]

  if new_user.save
    redirect "/view_apprentice/#{new_user.id}"
  else
    erb :index
  end
end
#create apprentice cv
get '/apprentice_cv' do

  erb :apprentice_cv
end


post '/apprentice_cv' do
  #education
  education = Education.new
  education.apprentice_profile_id = session[:id]
  education.school = params[:school]
  education.certification = params[:certification]
  education.year_completed = params[:year]
end


#display apprentice profile
get '/view_apprentice/:id' do
  @apprentice = ApprenticeProfile.find(params[:id])


  erb :view_apprentice
end

#edit apprentice profile
get '/apprentice/:id/edit' do
  erb :edit_apprentice
end

#update apprentice profile
put '/apprentice/:id' do

end



#delete apprentice
delete '/apprentice/:id' do

end


#employer login
get '/employer_login' do
  erb :employer_login
end



post '/session' do

  a_user = ApprenticeProfile.find_by(email: params[:email])

  if a_user && a_user.authenticate(params[:password])
    #you are authnticated and let me create a session for you.
    session[:id]  = a_user.id
    redirect '/view_apprentice'
  else
    # you are not authenticated.
    erb :index
  end
end

get '/session/new' do
  erb :index
end

delete '/session' do
  session[:id] = nil
  redirect '/session/new'
end
