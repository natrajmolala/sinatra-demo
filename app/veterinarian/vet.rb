class Vet
  COLLECTION = 'veterinarian'

  attr_accessor :firstname, :lastname, :speciality

  def initialize(firstname, lastname, speciality)
    @firstname = firstname
    @lastname = lastname
    @speciality = speciality
  end

  def to_json_string
    JSON.dump ({
                  :firstname => @firstname,
                  :lastname => @lastname,
                  :speciality => @speciality
              })
  end

  def to_json
    JSON.parse(to_json_string)
  end

  def self.from_json(string)
    data = JSON.load string
    self.new(data['firstname'], data['lastname'], data['speciality'])
  end

end