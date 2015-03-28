describe 'Vet class' do

  it 'initialise with name and speciality' do
    vet = Vet.new('John', 'Rambo', 'Radiology')
    expect(vet).to be_an_instance_of Vet
  end

  it 'has accessors for name and speciality' do
    vet = Vet.new('John', 'Rambo', 'Radiology')
    expect(vet.firstname).to eq 'John'
    expect(vet.lastname).to eq 'Rambo'
    expect(vet.speciality).to eq 'Radiology'
  end

  it 'should be converted to json' do
    vet = Vet.new('John', 'Rambo', 'Radiology')
    expect(vet.to_json).not_to be_nil
    expect(vet.to_json[:firstname]).to eq 'John'
    expect(vet.to_json[:lastname]).to eq 'Rambo'
    expect(vet.to_json[:speciality]).to eq 'Radiology'
  end

  it 'should be converted to object from json string' do
    vet = Vet.from_json("{\"firstname\":\"John\",\"lastname\":\"Rambo\",\"speciality\":\"Radiology\"}")
    expect(vet.firstname).to eq 'John'
    expect(vet.lastname).to eq 'Rambo'
    expect(vet.speciality).to eq 'Radiology'
  end

end