describe 'Vet class' do

  it 'takes name and speciality and returns vet object' do
    vet = Vet.new('John Rambo', 'Radiology')
    expect(vet).to be_an_instance_of Vet
  end

  it 'has accessors for name and speciality' do
    vet = Vet.new('John Rambo', 'Radiology')
    expect(vet.name).to eq 'John Rambo'
    expect(vet.speciality).to eq 'Radiology'
  end

end