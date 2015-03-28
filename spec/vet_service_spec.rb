describe 'Vet service' do

  before :each do
    $mongo_db[Vet::COLLECTION].remove()
  end

  it 'should add and fetch vets from db' do
    vet = Vet.new('Linda', 'Goodman', 'Radiology')
    PetClinic::VetService.add_vet vet

    vets = PetClinic::VetService.all_vets
    expect(vets).not_to be_nil
    expect(vets.empty?).to be_falsey
    expect(vets.first[1].firstname).to eq 'Linda'
  end

  it 'should remove vet from db' do
    vet = Vet.new('Ben', 'Crow', 'Radiology')
    PetClinic::VetService.add_vet vet

    vet = Vet.new('Linda', 'Goodman', 'Radiology')
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
    expect(vets.first[1].firstname).to eq 'Ben'

  end


end