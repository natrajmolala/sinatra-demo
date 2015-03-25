describe 'Owner class' do

  before :each do
    @pets = []
    @pets << Pet.new('Basil')
    @pets << Pet.new('Freddy')

    @contact_details = ContactDetails.new('345 Maple St', 'Madison', '020 3456 1234')
  end

  it 'initialise with firstname, lastname and array of pets' do
    owner = Owner.new('John', 'Rambo', @contact_details, @pets)
    expect(owner).to be_an_instance_of Owner
  end

  it 'has accessors for firstname, lastname and  pets' do
    owner = Owner.new('John', 'Rambo', @contact_details, @pets)
    expect(owner.firstname).to eq 'John'
    expect(owner.lastname).to eq 'Rambo'
    expect(owner.contact_details.city).to eq 'Madison'
    expect(owner.pets.size).to eq 2
    expect(owner.pets.first.name).to eq 'Basil'
  end

  it 'should be converted to json' do
    owner = Owner.new('John', 'Rambo', @contact_details,  @pets)
    expect(owner.to_json).to eq "{\"firstname\":\"John\",\"lastname\":\"Rambo\",\"contact_details\":\"{\\\"address_line\\\":\\\"345 Maple St\\\",\\\"city\\\":\\\"Madison\\\",\\\"telephone\\\":\\\"020 3456 1234\\\"}\",\"pets\":[\"{\\\"name\\\":\\\"Basil\\\"}\",\"{\\\"name\\\":\\\"Freddy\\\"}\"]}"
  end

  it 'should be converted to object from json string' do
    owner = Owner.from_json("{\"firstname\":\"John\",\"lastname\":\"Rambo\",\"contact_details\":\"{\\\"address_line\\\":\\\"345 Maple St\\\",\\\"city\\\":\\\"Madison\\\",\\\"telephone\\\":\\\"020 3456 1234\\\"}\",\"pets\":[\"{\\\"name\\\":\\\"Basil\\\"}\",\"{\\\"name\\\":\\\"Freddy\\\"}\"]}")
    expect(owner.firstname).to eq 'John'
    expect(owner.lastname).to eq 'Rambo'
    expect(owner.contact_details.city).to eq 'Madison'
    expect(owner.pets.size).to eq 2
    expect(owner.pets.first.name).to eq 'Basil'
  end

end