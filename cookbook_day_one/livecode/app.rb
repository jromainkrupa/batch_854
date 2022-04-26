require_relative "cookbook"
require_relative "recipe"
require_relative "router"
require_relative "controller"

filepath = "recipes.csv"
cookbook = Cookbook.new(filepath)


controller = Controller.new(cookbook)
Router.new(controller).run
