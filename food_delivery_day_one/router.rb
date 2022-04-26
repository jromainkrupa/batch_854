class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @run = true
  end

  def run
    while @run
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
