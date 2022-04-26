class Meal
  attr_accessor :id
  attr_reader :name, :price
  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def to_s
    "#{self.id} - #{self.name} (#{self.price})"
  end
end
