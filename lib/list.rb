class List

  def list
    doctor_count = grab_patients()
    doctor_results = grab_doctors(doctor_count)
    doctor_list = DB.exec("SELECT * FROM staff;")
    @list_with_count = {}
    doctor_results.each do |key,val|
      doctor_list.each do |entry|
        if entry[:id] == key
          @list_with_count[entry[:name]] = val
        end
      end
    end
    @list_with_count
  end

  def grab_patients
    patient_list = DB.exec("SELECT * FROM patients;")
    result_array = []
    patient_list.each() do |db_entry|
      result_array.push(db_entry[:doctor_id])
    end
    result_array
  end

  def grab_doctors(docs)
    results_hash = {}
    docs_uniq = docs.clone.uniq
    docs_uniq.each do |count_patients|
      count = 0
      docs.each do |instances|
        if instances == count_patients
          count += 1
        end
      end
      results_hash[count_patients] = count
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
