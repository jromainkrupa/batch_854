require_relative "router"
require_relative "repository"
require_relative "controller"
require_relative "view"


repository = Repository.new
view = View.new
controller = Controller.new(repository, view)
Router.new(controller).start
