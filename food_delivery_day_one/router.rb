class Router
  def initialize(meals_controller, customers_controller, session_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @run = true
    @session_controller = session_controller
    @orders_controller = orders_controller
  end

  def run
    # demander a l'employee de se sign in ??
    @employee = @session_controller.sign_in
    while @run && @employee
      if @employee.manager?
        print_manager_menu
        process_manager(gets.chomp)
      else
        print_rider_menu
        process_rider(gets.chomp)
      end
    end
  end

  private

  def process_manager(selection)
    case selection
    when "1"  then @meals_controller.list
    when "2"  then @meals_controller.create
    when "3"  then @customers_controller.list
    when "4"  then @customers_controller.create
    when "5"  then @orders_controller.list
    when "6"  then @orders_controller.add_order
    when "7"  then @orders_controller.list_undelivered_orders
    when "8"  then @run = false
    end
  end

  def process_rider(selection)
    case selection
    when "1"  then @orders_controller.mark_as_delivered
    when "2"  then @orders_controller.my_list_undelivered_orders(@employee)
    when "3"  then @run = false
    end
  end

  def print_manager_menu
    puts "1. List all meals"
    puts "2. Add meal"
    puts "3. List all customers"
    puts "4. Add customer"
    puts "5. list orders"
    puts "6. Add order"
    puts "7. list undelivered orders"
    puts "8. Exit"
    print "> "
  end

  def print_rider_menu
    puts "1. I can mark one of my orders as delivered"
    puts "2. list all my undelivered orders"
    puts "3. Exit"
    print "> "
  end
end
