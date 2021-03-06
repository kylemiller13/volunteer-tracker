require('rspec')
require('pg')
require('volunteer')
require('project')
require('pry')
require('./db_access.rb')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM volunteers *;")
    DB.exec("DELETE FROM projects *;")
  end
end