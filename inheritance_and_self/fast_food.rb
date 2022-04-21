require_relative "restaurant"


class FastFood < Restaurant
  def initialize(name, food_type, note, capacity, prep_time)
    super(name, food_type,note,capacity)

    @prep_time = prep_time
  end

  undef book

end
