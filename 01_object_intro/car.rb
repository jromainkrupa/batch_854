class Car
  attr_reader :color, :price, :toto, :size
  # attr_writer :color
  attr_accessor :color

  def initialize(color)
    @engine_started = false
    toto = "toto"
  end

  def color=(new_color)
    @color = new_color
  end

  def color
    @color
  end

  def paint(color)
    @color = color
  end

  # def repaint(new_color)
  #   @color = new_color
  #   ap toto
  # end

  def start_engine
    toto = "toto"
    @engine_started = true
  end

  def engine_started?
    @engine_started
  end



  private

  def change_car_owner
    @owner = "jeanro"
    # fancy stuff
  end

  def validate_phone_number
  end

end
