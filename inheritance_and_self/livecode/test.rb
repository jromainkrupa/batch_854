require_relative "animal"
require_relative "meerkat"
require_relative "warthog"
require_relative "lion"

# Define an Animal with an initialize(name) constructor, exposing its name.
# Define three Lion, Meerkat and Warthog classes
pumba = Warthog.new("pumba")
timon = Meerkat.new("timon")
nala = Lion.new("nala")
simba = Lion.new("simba")

# Implement a #talk instance method which returns a sentence like "Simba roars" for each animal. (Hint: Meerkats bark and Warthog grunt)
pumba.talk
# => "Pumba grunt."

simba.talk
# => "Simba roars."

nala.talk
# => "Nala roars."

timon.talk
# => "Timon grunt"

# In another Ruby file, create an array with Simba, Nala, Timon & Pumbaa, iterate over it and puts the sound each animal make
animals = [simba, nala, timon, pumba]

# animals.each do |animal|
#   puts animal.talk
# end


# Implement a ::phyla class method which will return an array of the four phyla of the animal kingdom.
Animal.phyla
# => [Annelida, Chordata, Cnidaria, Echinodermata, Mollusca]

# Add an #eat(food) instance method in Animal which returns a sentence
# like “Timon eats a scorpion”.
# Then override this method for the Lion class, and return a sentence
# like “Simba eats a gazelle. Law of the Jungle!

timon.eat("scorpion")
# => “Timon eats a scorpion”

pumba.eat("larve")

simba.eat("gazelle")
# => “Simba eats a gazelle. Law of the Jungle!"

timon.eat("#{simba.class}: #{simba.name}")


class Test
  def name(name)
    @name = name
    return self
  end

  def color(color)
    @color= color
    return self
  end

  def species(species)
    @species= species
    return self
  end

end

instance = Test.new
instance.name("toto")
instance.color("red")
....



Test.new.name("toto").color("red").species("lion")

Animal.phyla
