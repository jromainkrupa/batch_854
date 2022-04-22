require "amazing_print"

class Animal
  attr_reader :name

  def initialize(name)
    @name = name.capitalize
  end

  def eat(food)
    "#{@name} eats a #{food}"
  end

  def self.phyla
    ["Annelida", "Chordata", "Cnidaria", "Echinodermata", "Mollusca"]
  end

  def talk
    @name
  end

end
