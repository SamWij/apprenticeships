# require 'pry'
require 'sinatra'
# require 'sinatra/reloader'
require 'active_record'
require_relative 'database_config'
require_relative 'models/apprentice'
require_relative 'models/qualification'
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
    redirect "/"
  else
    erb :index
  end
end



post '/apprentice_cv' do
  new_user = session[:id]
  #workPreferences
  work_pref = WorkPreferences.new
  work_pref.apprentice_profile_id = session[:id]
  work_pref.preferred_work_location = params[:location]
  work_pref.apprentice_level = params[:level]
  work_pref.jobseeking_status = params[:status]
  work_pref.save

  #work_experiences1
  work_exp = WorkExperience.new
  work_exp.apprentice_profile_id = session[:id]
  work_exp.company = params[:company_name1]
  work_exp.title = params[:composition_title1]
  work_exp.summary = params[:duties_1]
  work_exp.date_started = params[:start_date1]
  work_exp.date_finished = params[:finish_date1]
  work_exp.save

  #work_experiences2
  work_exp = WorkExperience.new
  work_exp.apprentice_profile_id = session[:id]
  work_exp.company = params[:company_name2]
  work_exp.title = params[:composition_title2]
  work_exp.summary = params[:duties_2]
  work_exp.date_started = params[:start_date2]
  work_exp.date_finished = params[:finish_date2]
  work_exp.save

  #work_experiences3
  work_exp = WorkExperience.new
  work_exp.apprentice_profile_id = session[:id]
  work_exp.company = params[:company_name3]
  work_exp.title = params[:composition_title3]
  work_exp.summary = params[:duties_3]
  work_exp.date_started = params[:start_date3]
  work_exp.date_finished = params[:finish_date3]
  work_exp.save

  #education1
  education = Qualification.new
  education.apprentice_profile_id = session[:id]
  education.school = params[:school_name1]
  education.certification = params[:certification1]
  education.year_completed = params[:year1]
  education.save

  #education2
  education = Qualification.new
  education.apprentice_profile_id = session[:id]
  education.school = params[:school_name2]
  education.certification = params[:certification2]
  education.year_completed = params[:year2]
  education.save

  #education3
  education = Qualification.new
  education.apprentice_profile_id = session[:id]
  education.school = params[:school_name3]
  education.certification = params[:certification3]
  education.year_completed = params[:year3]
  education.save

  #licenses1
  license = License.new
  license.apprentice_profile_id = session[:id]
  license.name = params[:license1]
  license.state_held = params[:license_state1]
  license.save

  #licenses2
  license = License.new
  license.apprentice_profile_id = session[:id]
  license.name = params[:license2]
  license.state_held = params[:license_state2]
  license.save

  #licenses3
  license = License.new
  license.apprentice_profile_id = session[:id]
  license.name = params[:license3]
  license.state_held = params[:license_state3]
  license.save

  #referee1
  referee = Referee.new
  referee.apprentice_profile_id = session[:id]
  referee.name = params[:referee_name1]
  referee.email = params[:referee_email1]
  referee.relationship = params[:relationship1]
  referee.phone = params[:referee_phone1]
  referee.save

  #referee2
  referee = Referee.new
  referee.apprentice_profile_id = session[:id]
  referee.name = params[:referee_name2]
  referee.email = params[:referee_email2]
  referee.relationship = params[:relationship2]
  referee.phone = params[:referee_phone2]
  referee.save

  #referee3
  referee = Referee.new
  referee.apprentice_profile_id = session[:id]
  referee.name = params[:referee_name3]
  referee.email = params[:referee_email3]
  referee.relationship = params[:relationship3]
  referee.phone = params[:referee_phone3]
  referee.save

  redirect "/view_apprentice/#{new_user}"
end

#create apprentice cv
get '/apprentice_cv/:id' do
  @apprentice = ApprenticeProfile.find(params[:id])
  erb :apprentice_cv
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
    redirect "/view_apprentice/#{a_user.id}"
  else
    # you are not authenticated.
    erb :index
  end
end

#display apprentice profile
get "/view_apprentice/:id" do
  @apprentice = ApprenticeProfile.find(params[:id])

  erb :view_apprentice
end

#edit apprentice profile
get '/edit_apprentice/edit/:id' do
  @apprentice = ApprenticeProfile.find(params[:id])
  id = @apprentice
  @workpref = WorkPreferences.find(id)
  @industries = Industry.all
  @states = State.all

  erb :edit_apprentice
end

#display apprentice profile
post "/view_apprentice/:id" do
  @apprentice = ApprenticeProfile.find(params[:id])

  erb :view_apprentice
end

#update apprentice profile
put "/view_apprentice/:id" do
  update = ApprenticeProfile.find(params[:id])
  update_workpref = WorkPreferences.find(update)
  industry = Industry.find(update)
  industry.name = params[:update_industry_id]
  update.firstname = params[:update_firstname]
  update.surname = params[:update_surname]
  update.email = params[:update_email]
  update.mobile_no = params[:update_mobile]
  update.state_id = params[:update_state]
  update.postcode = params[:update_postcode]
  update.save

  update_workpref.apprentice_level = params[:update_level]
  update_workpref.preferred_work_location = params[:update_location]
  update_workpref.jobseeking_status = params[:update_status]
  update_workpref.save

  redirect "/view_apprentice/#{update.id}"
end

get '/session/new' do
  erb :index
end

delete '/session' do
  session[:id] = nil
  redirect '/session/new'
end
