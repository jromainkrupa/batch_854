class Restaurant
  attr_reader :food_type, :name

  # DATA
  def initialize(name, food_type, note, capacity)
    @name = name
    @food_type = food_type
    @note = note
    @capacity = capacity
    @clients = []
  end

  def self.categories
    ["burger", "pizza", "brasserie"]
  end

  def book(client_name)
    if !full?
        @clients << client_name
    else
      puts "désole plus de place"
    end
  end

  def full?
    @capacity == @clients.count
  end

  def close?
    !open?
  end


  def open?
    Time.now.hour >= 18 && Time.now.hour <= 22
  end
end
