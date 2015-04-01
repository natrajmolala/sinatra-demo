require_relative '../common/base_init'

class Owner
  include BaseInit

  attr_accessor :first_name, :last_name, :contact_details, :pets

  def to_json
    {
        :first_name => @first_name,
        :last_name => @last_name,
        :contact_details => @contact_details.to_json,
        :pets => pets_to_json
    }.to_json
  end

  def self.from_json(string)
    data = JSON.load string
    cd = ContactDetails.new
    cd.from_json(data['@contact_details'])
    self.new(:first_name => data['@first_name'],
             :last_name => data['@last_name'],
             :contact_details => cd,
             :pets => self.pets_from_json(data['@pets']))
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
      pet = Pet.new
      pet.from_json(pet_json_str)
      pets_json << pet
    end
    pets_json
  end

end