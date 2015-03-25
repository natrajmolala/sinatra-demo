class Pet

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_json
    { :name => @name }.to_json
  end

  def self.from_json(string)
    data = JSON.load string
    self.new(data['name'])
  end
end