require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'apprenticeships'

}


ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)
