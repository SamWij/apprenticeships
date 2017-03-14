class Industry < ActiveRecord::Base
   has_many :apprentice_profiles
   has_many :employer_profiles


end
