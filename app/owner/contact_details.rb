require_relative '../common/base_init'

class ContactDetails
  include BaseInit

  attr_accessor :address_line, :city, :telephone

  # def initialize(address_line, city, telephone)
  #   @address_line = address_line
  #   @city = city
  #   @telephone = telephone
  # end
  #
  # def to_json
  #   {
  #       :address_line => @address_line,
  #       :city => @city,
  #       :telephone => @telephone
  #   }.to_json
  # end
  #
  # def self.from_json(string)
  #   data = JSON.load string
  #   self.new(data['address_line'], data['city'], data['telephone'])
  # end

end