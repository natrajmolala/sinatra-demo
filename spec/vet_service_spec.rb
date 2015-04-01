describe 'Vet service' do

  before :each do
    $mongo_db[Vet::COLLECTION].remove()
  end

  it 'should add and fetch vets from db' do
    vet = Vet.new(first_name: 'Linda',
                  last_name: 'Goodman',
                  speciality: 'Radiology')
    PetClinic::VetService.add_vet vet

    vets = PetClinic::VetService.all_vets
    expect(vets).not_to be_nil
    expect(vets.empty?).to be_falsey
    expect(vets.first[1].first_name).to eq 'Linda'
  end

  it 'should remove vet from db' do
    vet = Vet.new(first_name: 'Ben',
                  last_name: 'Crow',
                  speciality: 'Radiology')
    PetClinic::VetService.add_vet vet

    vet = Vet.new(first_name: 'Linda',
                  last_name: 'Goodman',
                  speciality: 'Radiology')
    linda_id = PetClinic::VetService.add_vet vet

    vets = PetClinic::VetService.all_vets
    expect(vets).not_to be_nil
    expect(vets.empty?).to be_falsey
    expect(vets.size).to eq 2

    PetClinic::VetService.remove_vet linda_id.to_s
    vets = PetClinic::VetService.all_vets
    expect(vets).not_to be_nil
    expect(vets.empty?).to be_falsey
    expect(vets.size).to eq 1
    expect(vets.first[1].first_name).to eq 'Ben'

  end


end