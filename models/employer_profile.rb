class EmployerProfile < ActiveRecord::Base
  belongs_to :industry
  has_secure_password
    #for bcrypt use will digest the password and encrypt

end
