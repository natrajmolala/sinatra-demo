describe 'Vet class' do

  it 'initialise with name and speciality' do
    vet = Vet.new(:first_name => 'John', :last_name => 'Rambo', :speciality => 'Radiology')
    expect(vet).to be_an_instance_of Vet
  end

  it 'has accessors for name and speciality' do
    vet = Vet.new(:first_name => 'John', :last_name => 'Rambo', :speciality => 'Radiology')
    expect(vet.first_name).to eq 'John'
    expect(vet.last_name).to eq 'Rambo'
    expect(vet.speciality).to eq 'Radiology'
  end

  it 'should be converted to json' do
    vet = Vet.new(:first_name => 'John', :last_name => 'Rambo', :speciality => 'Radiology')
    expect(vet.to_json).not_to be_nil
    expect(vet.to_json).to eq "{\"@first_name\":\"John\",\"@last_name\":\"Rambo\",\"@speciality\":\"Radiology\"}"
  end

  it 'should be converted to object from json string' do
    vet = Vet.new
    vet.from_json("{\"@first_name\":\"John\",\"@last_name\":\"Rambo\",\"@speciality\":\"Radiology\"}")
    expect(vet.first_name).to eq 'John'
    expect(vet.last_name).to eq 'Rambo'
    expect(vet.speciality).to eq 'Radiology'
  end

end