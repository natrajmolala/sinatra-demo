module PetClinic
  module VetService

    def self.all_vets
      result = {}
      vets_array = $mongo_db[Vet::COLLECTION].find().to_a
      vets_array.each do |vet_db|
        result[vet_db['_id']] = Vet.new(:first_name => vet_db['@first_name'],
                                        :last_name => vet_db['@last_name'],
                                        :speciality => vet_db['@speciality'])
      end
      result
    end

    def self.add_vet(vet)
      $mongo_db[Vet::COLLECTION].insert(JSON.parse(vet.to_json))
    end

    def self.remove_vet(vet_id)
      vet = $mongo_db[Vet::COLLECTION].find_one(:_id => BSON::ObjectId(vet_id))
      $mongo_db[Vet::COLLECTION].remove(vet)
    end

  end
end