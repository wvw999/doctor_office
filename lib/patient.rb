class Patient

  def initialize(attributes)
    @patient_name = attributes.fetch(:patient_name)
    @dob = attributes.fetch(:dob)
    @doc_id = attributes.fetch(:doc_id)
  end

  def add_patient
      DB.exec("INSERT INTO patients (name, birthdate, doctor_id) VALUES ('#{@patient_name}', '#{@dob}', #{@doc_id});")
  end

end
