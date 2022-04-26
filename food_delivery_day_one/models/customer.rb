class Customer
  attr_accessor :id
  attr_reader :name, :address
  def initialize(attributes = {})
    @name = attributes[:name]
    @id = attributes[:id]
    @address = attributes[:address]
  end

  def to_s
    "#{self.id} - #{self.name} (#{self.address})"
  end
end
