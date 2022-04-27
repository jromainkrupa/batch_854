class Router
  def initialize(meals_controller, customers_controller, session_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @run = true
    @session_controller = session_controller
  end

  def run
    # demander a l'employee de se sign in ??
    sign_in = @session_controller.sign_in
    while @run && sign_in
      print_menu
      process(gets.chomp)
    end
  end

  private

  def process(selection)
    case selection
    when "1"  then @meals_controller.list
    when "2"  then @meals_controller.create
    when "3"  then @customers_controller.list
    when "4"  then @customers_controller.create
    when "5"  then @run = false
    end
  end

  def print_menu
    puts "1. List all meals"
    puts "2. Add meal"
    puts "3. List all customers"
    puts "4. Add customer"
    puts "5. Exit"
    print "> "
  end
end
