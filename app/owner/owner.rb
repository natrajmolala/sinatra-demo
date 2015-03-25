class Owner

  attr_accessor :firstname, :lastname, :pets

  def initialize(firstname, lastname, pets)
    @firstname = firstname
    @lastname = lastname
    @pets = pets
  end

  def to_json
    {
        :firstname => @firstname,
        :lastname => @lastname,
        :pets => pets_to_json
    }.to_json
  end

  def self.from_json(string)
    data = JSON.load string
    self.new(data['firstname'], data['lastname'], self.pets_from_json(data['pets']))
  end

  private

  def pets_to_json
    pets_json = []
    @pets.each do |pet|
      pets_json << pet.to_json
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