require_relative '../common/base_init'

class ContactDetails
  include BaseInit

  attr_accessor :address_line, :city, :telephone

end