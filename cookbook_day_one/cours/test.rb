require_relative "task"
require_relative "repository"
require_relative "controller"
require_relative "view"
require "amazing_print"

repository = Repository.new

menage = Task.new("menage")
lessive = Task.new("lessive")


repository.add(menage)
repository.add(lessive)

# ACTIONS
view = View.new

controller = Controller.new(repository,view)
# 1. lister les taches
controller.list
# 2. ajouter une tache
controller.add_a_task
# 3. marks as done a task
controller.mark_as_done

controller.list
