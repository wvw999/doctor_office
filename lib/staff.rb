class Staff

  def initialize(attributes)
    @doctor_name = attributes.fetch(:doctor_name)
    @specialty = attributes.fetch(:specialty)
  end

  def doc_dropdown
    DB.exec("SELECT id, name FROM staff WHERE is_doctor;")
  end

  def add_staff

    DB.exec("INSERT INTO staff (name, specialty, is_doctor) VALUES ('#{@doctor_name}', '#{@specialty}', true);")
  end

end
