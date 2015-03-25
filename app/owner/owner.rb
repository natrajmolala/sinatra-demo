class Owner

  attr_accessor :firstname, :lastname, :contact_details, :pets

  def initialize(firstname, lastname, contact_details, pets)
    @firstname = firstname
    @lastname = lastname
    @contact_details = contact_details
    @pets = pets
  end

  def to_json
    {
        :firstname => @firstname,
        :lastname => @lastname,
        :contact_details => @contact_details.to_json,
        :pets => pets_to_json
    }.to_json
  end

  def self.from_json(string)
    data = JSON.load string
    self.new(data['firstname'], data['lastname'], ContactDetails.from_json(data['contact_details']), self.pets_from_json(data['pets']))
  end

  private

  def pets_to_json
    pets_json = []
    unless @pets.nil?
      @pets.each do |pet|
        pets_json << pet.to_json
      end
    end
    pets_json
  end

  def self.pets_from_json(pets_array)
    pets_json = []
    pets_array.each do |pet_json_str|
      pets_json << Pet.from_json(pet_json_str)
    end
    pets_json
  end

end