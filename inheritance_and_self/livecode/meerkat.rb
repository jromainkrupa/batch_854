require_relative "animal"

class Meerkat < Animal

  def talk
    super + " bark."
  end
end
