require_relative '../common/base_init'

class Vet
  include BaseInit

  COLLECTION = 'veterinarian'

  attr_accessor :first_name, :last_name, :speciality

end