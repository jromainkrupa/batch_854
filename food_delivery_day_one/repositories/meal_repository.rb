require_relative "../models/meal"
require_relative "./record_repository"
require 'CSV'

class MealRepository < RecordRepository

  private

  def row_to_record(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    Meal.new(row)
  end

  def headers
    ["id", "name", "price"]
  end

  def record_to_row(meal)
    [meal.id, meal.name, meal.price]
  end
end
