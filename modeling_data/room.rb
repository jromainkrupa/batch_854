class Room
  class OverCapacityError < StandardError
  end

  attr_reader :patients
  attr_accessor

  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || []
  end

  def add_patient(patient)
    raise OverCapacityError, "Room is full!" if full?
    patient.room = self
    @patients << patient
  end

  def full?
    @patients.count == @capacity
  end
end

# Room.new(capacity: 2)
