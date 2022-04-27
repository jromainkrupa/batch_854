require_relative "./record_repository"
require_relative "../models/employee"

class EmployeeRepository < RecordRepository

  undef create

  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end


  private

  def row_to_record(row)
    row[:id] = row[:id].to_i
    Employee.new(row)
  end

  def headers
    ["id", "username", "password", "role"]
  end

  undef save_csv


  def record_to_row(employee)
    [employee.id, employee.name, employee.price, employee.role]
  end
end
