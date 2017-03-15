class ApprenticeProfile < ActiveRecord::Base
  has_many :licenses
  has_many :referees
  has_many :work_experiences
  has_many :educations
  belongs_to :industry
  belongs_to :state

  has_secure_password
    #for bcrypt use will digest the password and encrypt


end
