class Specialty

  def grab_specialties
    results_array = []
    specialty_list = DB.exec("SELECT * FROM staff WHERE is_doctor;")
    specialty_list.each do |special|
      results_array.push [special["name"], special["specialty"]]
    end
    results_array
  end

end
