describe 'Vet class' do

  it 'takes name and speciality and returns vet object' do
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
    expect(vet.to_json_string).to eq "{\"firstname\":\"John\",\"lastname\":\"Rambo\",\"speciality\":\"Radiology\"}"
  end

  it 'should be converted to object from json string' do

    vet = Vet.from_json("{\"firstname\":\"John\",\"lastname\":\"Rambo\",\"speciality\":\"Radiology\"}")
    expect(vet.firstname).to eq 'John'
    expect(vet.lastname).to eq 'Rambo'
    expect(vet.speciality).to eq 'Radiology'
  end

end