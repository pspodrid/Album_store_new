require 'rspec'
require 'pg'
require 'project'
require 'song'
require 'pry'
require 'artist'

DB = PG.connect({:dbname =>'record_store'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM albums *;")
    DB.exec("DELETE FROM songs *;")
  end
end
