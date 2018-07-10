class List

  def list
    doctor_count = grab_patients()
    doctor_results = grab_doctors(doctor_count)
    doctor_list = DB.exec("SELECT * FROM staff;")
    # binding.pry
    doctor_list
  end

  def grab_patients
    patient_list = DB.exec("SELECT * FROM patients;")
    result_array = []
    patient_list.each() do |db_entry|
      result_array.push(db_entry["doctor_id"])
    end
    result_array
  end

  def grab_doctors(docs)
    results_hash = {}
    docs_uniq = docs.clone.uniq
    docs_uniq.each do |count_patients|
      find_name = DB.exec("SELECT name FROM staff WHERE id = 4;")
      results_hash[find_name['name']] = docs.count(count_patients)
      binding.pry
    end
    results_hash
  end

end

# medical_record.id
# medical_record.record_info
# medical_record.doctor_id
# medical_record.patient_id
# medical_record.visit_id
# visits.id
# visits.date
# visits.doctor_id
# visits.patient_id
# staff.id
# staff.name
# staff.specialty
# staff.is_doctor
# patients.id
# patients.name
# patients.birthdate
# patients.doctor_id
