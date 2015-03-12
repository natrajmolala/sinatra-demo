describe 'Vet class' do

  it 'takes name and speciality and returns vet object' do
    vet = Vet.new('John Rambo', 'Radiology')
    vet.should be_an_instance_of Vet
  end

  it 'has accessors for name and speciality' do
    vet = Vet.new('John Rambo', 'Radiology')
    vet.name.should eql 'John Rambo'
    vet.speciality.should eql 'Radiology'
  end

end