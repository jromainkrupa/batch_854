class Router
  def initialize(controller)
    @controller = controller
    @run = true
  end

  def start
    while @run
      display_menu
      print "> "
      choice = gets.chomp
      set_action(choice)
    end
  end

  private

  def display_menu
    puts "1. Listez les taches"
    puts "2. Ajouter une tache"
    puts "3. Marquer une tache comme effectuée"
    puts "4. quit"
  end

  def set_action(choice)
    case choice
    when "1" then @controller.list
    when "2" then @controller.add_a_task
    when "3" then @controller.mark_as_done
    when "4" then @run = false
    end
  end
end
