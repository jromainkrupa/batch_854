require_relative '../views/customer_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomerView.new
  end

  def list
    # 1. Demander les customers au repository
    customers = @customer_repository.all
    # 2. Demander à la vue de les afficher
    @view.display(customers)
  end

  def create
    # 1. Demande à la vue un nom et un prix
    name = @view.ask_for("name")
    address = @view.ask_for("address")
    # 2. On creé une instance de customer
    customer = Customer.new(name: name, address: address)
    # 3. On ajoute le customer au repo
    @customer_repository.create(customer)
    # 4. list
    list
  end
end
