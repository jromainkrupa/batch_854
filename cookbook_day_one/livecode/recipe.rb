class Recipe
  attr_reader :name, :description, :rating, :prep_time

  def initialize(attributes = {})
    @name = attributes[:name] ||= "toto"
    @description = attributes[:description]
    @rating = attributes[:rating]
    @prep_time = attributes[:prep_time]
    @status = attributes[:status] || false
  end

  def status?
    @status
  end

  def mark_recipe_as_done
    @status = true
  end
end

# attributes = {
#   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod te", toto: "toto"
#   name: "toto",
# }

# Recipe.new(attributes)
