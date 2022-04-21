require_relative "restaurant"
require_relative "chef"

class Gastro < Restaurant
  attr_reader :chef
  def initialize(name, food_type, note, capacity, star, chef_name)
    super(name, food_type,note,capacity)
    @star = star

    @chef = Chef.new(chef_name, self)
  end

  def toto
    ap self
  end
end
