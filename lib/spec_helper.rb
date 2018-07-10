require("rspec")
require("pg")
require("list")
require("staff")
require("patient")
require("pry")

DB = PG.connect({:dbname => "doctors"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM visits *;")
    DB.exec("DELETE FROM medical_record *;")
    DB.exec("DELETE FROM staff *;")
    DB.exec("DELETE FROM patients *;")
  end
end
