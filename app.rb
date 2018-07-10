require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/list")
require("./lib/staff")
require("./lib/patient")
require("pry")
require("pg")


DB = PG.connect({:dbname => "doctors"})

get ('/') do

end

post ('/') do

end

get ('/list') do
  build_list = List.new
  @doctor_list = build_list.list
  erb(:list)
end
