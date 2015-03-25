describe 'ContactDetails class' do

  it 'initialise with address_line, city and telephone' do
    contact_details = ContactDetails.new('345 Maple St', 'Madison', '020 3456 1234')
    expect(contact_details).to be_an_instance_of ContactDetails
  end

  it 'has accessors for address_line, city and telephone' do
    contact_details = ContactDetails.new('345 Maple St', 'Madison', '020 3456 1234')
    expect(contact_details.address_line).to eq '345 Maple St'
    expect(contact_details.city).to eq 'Madison'
    expect(contact_details.telephone).to eq '020 3456 1234'
  end

  it 'should be converted to json' do
    contact_details = ContactDetails.new('345 Maple St', 'Madison', '020 3456 1234')
    expect(contact_details.to_json).to eq "{\"address_line\":\"345 Maple St\",\"city\":\"Madison\",\"telephone\":\"020 3456 1234\"}"
  end

  it 'should be converted to object from json string' do
    contact_details = ContactDetails.from_json("{\"address_line\":\"345 Maple St\",\"city\":\"Madison\",\"telephone\":\"020 3456 1234\"}")
    expect(contact_details.address_line).to eq '345 Maple St'
    expect(contact_details.city).to eq 'Madison'
    expect(contact_details.telephone).to eq '020 3456 1234'
  end

end