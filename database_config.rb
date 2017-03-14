require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'apprentices'
}

ActiveRecord::Base.establish_connection(options)
