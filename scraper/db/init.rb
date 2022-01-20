
ActiveRecord::Base.establish_connection \
  adapter:  'postgresql',
  host:     'localhost',
  username:  ENV['PSQL_USER'],
  password:  ENV['PSQL_PSWD'],
  database: 'ted'

require_relative './records'
