require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'apprenticeships'

}

ActiveRecord::Base.establish_connection(options)
