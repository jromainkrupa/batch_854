class Patient
  attr_accessor :room, :id

  def initialize(attributes = {})
    @name = attributes[:name]
    @cured = false
  end

  def cure!
    @cured = true
  end
end

Patient.new(name: "toto")
