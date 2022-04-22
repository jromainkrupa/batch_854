require_relative "animal"

class Warthog < Animal

  def talk
    super + " grunt."
  end
end
