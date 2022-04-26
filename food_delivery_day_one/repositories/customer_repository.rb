require_relative "../models/customer"
require_relative "./record_repository"
require 'CSV'

class CustomerRepository < RecordRepository

  private

  def row_to_record(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end

  def headers
    ["id", "name", "address"]
  end

  def record_to_row(customer)
    [customer.id, customer.name, customer.address]
  end
end
