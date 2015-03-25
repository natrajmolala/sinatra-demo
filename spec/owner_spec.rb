describe 'Owner class' do

  before :each do
    @pets = []
    @pets << Pet.new('Basil')
    @pets << Pet.new('Freddy')
  end

  it 'initialise with firstname, lastname and array of pets' do
    owner = Owner.new('John', 'Rambo', @pets)
    expect(owner).to be_an_instance_of Owner
  end

  it 'has accessors for firstname, lastname and  pets' do
    owner = Owner.new('John', 'Rambo', @pets)
    expect(owner.firstname).to eq 'John'
    expect(owner.lastname).to eq 'Rambo'
    expect(owner.pets.size).to eq 2
    expect(owner.pets.first.name).to eq 'Basil'
  end

  it 'should be converted to json' do
    owner = Owner.new('John', 'Rambo', @pets)
    expect(owner.to_json).to eq "{\"firstname\":\"John\",\"lastname\":\"Rambo\",\"pets\":[\"{\\\"name\\\":\\\"Basil\\\"}\",\"{\\\"name\\\":\\\"Freddy\\\"}\"]}"
  end

  it 'should be converted to object from json string' do
    owner = Owner.from_json("{\"firstname\":\"John\",\"lastname\":\"Rambo\",\"pets\":[\"{\\\"name\\\":\\\"Basil\\\"}\",\"{\\\"name\\\":\\\"Freddy\\\"}\"]}")
    expect(owner.firstname).to eq 'John'
    expect(owner.lastname).to eq 'Rambo'
    expect(owner.pets.size).to eq 2
    expect(owner.pets.first.name).to eq 'Basil'
  end

end