describe 'Owner class' do

  before :each do
    @pets = []
    @pets << Pet.new(name: 'Basil')
    @pets << Pet.new(name: 'Freddy')

    @contact_details = ContactDetails.new(address_line: '345 Maple St',
                                          city: 'Madison',
                                          telephone: '020 3456 1234')
  end

  it 'initialise with firstname, lastname and array of pets' do
    owner = Owner.new(first_name: 'John',
                      last_name: 'Rambo',
                      contact_details: @contact_details,
                      pets: @pets)
    expect(owner).to be_an_instance_of Owner
  end

  it 'has accessors for firstname, lastname and  pets' do
    owner = Owner.new(first_name: 'John',
                      last_name: 'Rambo',
                      contact_details: @contact_details,
                      pets: @pets)
    expect(owner.first_name).to eq 'John'
    expect(owner.last_name).to eq 'Rambo'
    expect(owner.contact_details.city).to eq 'Madison'
    expect(owner.pets.size).to eq 2
    expect(owner.pets.first.name).to eq 'Basil'
  end

  it 'should be converted to json' do
    owner = Owner.new(first_name: 'John',
                      last_name: 'Rambo',
                      contact_details: @contact_details,
                      pets: @pets)
    expect(owner.to_json).to eq "{\"first_name\":\"John\",\"last_name\":\"Rambo\",\"contact_details\":\"{\\\"@address_line\\\":\\\"345 Maple St\\\",\\\"@city\\\":\\\"Madison\\\",\\\"@telephone\\\":\\\"020 3456 1234\\\"}\",\"pets\":[\"{\\\"@name\\\":\\\"Basil\\\"}\",\"{\\\"@name\\\":\\\"Freddy\\\"}\"]}"
  end

  it 'should be converted to object from json string' do
    owner = Owner.from_json("{\"@first_name\":\"John\",\"@last_name\":\"Rambo\",\"@contact_details\":\"{\\\"@address_line\\\":\\\"345 Maple St\\\",\\\"@city\\\":\\\"Madison\\\",\\\"@telephone\\\":\\\"020 3456 1234\\\"}\",\"@pets\":[\"{\\\"@name\\\":\\\"Basil\\\"}\",\"{\\\"@name\\\":\\\"Freddy\\\"}\"]}")
    expect(owner.first_name).to eq 'John'
    expect(owner.last_name).to eq 'Rambo'
    expect(owner.contact_details.city).to eq 'Madison'
    expect(owner.pets.size).to eq 2
    expect(owner.pets.first.name).to eq 'Basil'
  end

end