module BaseInit
  def initialize(*h)
    if h.length == 1 && h.first.kind_of?(Hash)
      h.first.each { |k,v| instance_variable_set("@#{k}",v) }
    end
  end

  def to_json
    hash = {}
    self.instance_variables.each do |var|
      hash[var] = self.instance_variable_get("#{var}")
    end
    hash.to_json
  end

  def from_json(string)
    JSON.load(string).each do |var, val|
      self.instance_variable_set(var, val)
    end
  end

end