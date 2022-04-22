require_relative "restaurant"
require_relative "fast_food"
require_relative "chef"
require_relative "gastro"
require 'amazing_print'

 le_bomp = Restaurant.new("Le Bomp", "brasserie", 3, 30)

 mcdo = FastFood.new("mcdonald", "burger", 1, 1000, 2)
 bocuse = Gastro.new("Bocuse", "gastro", 5, 10, 3, "Benj")

#  benj = Chef.new("Benj", bocuse)

# puts bocuse.chef.restaurant.name


bocuse.toto



# Restaurant.categories
 # ["burger", "pizza", "brasserie"....]



#  ap FastFood.ancestors

require 'json'

# JSON.parse # parse est une méthode de class

# CSV.open

# String.ancestors


# p mcdo
# p bocuse
# # setter
# p le_bomp.food_type

# p le_bomp.open?

# puts "Le restaurant #{le_bomp.name} est #{le_bomp.open? ? "ouvert" : "fermé"}."

# # Un client appel le resto, le manager book une table ....
# p le_bomp.book("Jeanro")
