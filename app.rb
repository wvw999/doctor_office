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
erb(:input)
end

post ('/') do
erb(:input)
end

get ('/list') do
  build_list = List.new
  @doctor_list = build_list.list
  erb(:list)
end

get ('/staff') do
  @doctor_name = "none"
  @specialty = "blank"
  doc = Staff.new({:doctor_name => @doctor_name, :specialty => @specialty})
  @doc_list = doc.doc_dropdown
  erb(:staff)
end

post ('/add_doctor') do
  @doctor_name = params["doctor_name"]
  @specialty = params["specialty"]
  doc = Staff.new({:doctor_name => @doctor_name, :specialty => @specialty})
  @doc_list = doc.doc_dropdown
  doc.add_staff
  redirect to('/')
end

post ('/add_patient') do
  @patient_name = params["patient_name"]
  @dob = params["dob"]
  @doc_id = params["doc_drop"]
  sickypants = Patient.new({:patient_name => @patient_name, :dob => @dob, :doc_id => @doc_id})
  sickypants.add_patient()
  redirect to('/')
end
