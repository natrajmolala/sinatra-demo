describe 'Pet class' do

  it 'initialise with name' do
    pet = Pet.new('Basil')
    expect(pet).to be_an_instance_of Pet
  end

  it 'has accessors for name' do
    pet = Pet.new('Basil')
    expect(pet.name).to eq 'Basil'
  end

  it 'should be converted to json' do
    pet = Pet.new('Basil')
    expect(pet.to_json).to eq "{\"name\":\"Basil\"}"
  end

  it 'should be converted to object from json string' do
    pet = Pet.from_json("{\"name\":\"Basil\"}")
    expect(pet.name).to eq 'Basil'
  end

end