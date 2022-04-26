require_relative "room"
require_relative "patient"


john = Patient.new(name: "John")
ringo = Patient.new(name: "Ringo")

blue_room = Room.new(capacity: 2)

blue_room.add_patient(john)
blue_room.add_patient(ringo)

jean = Patient.new(name: "jean")


# blue_room.add_patient(jean)

begin
  blue_room.add_patient(jean)

rescue Room::OverCapacityError => e
  puts ""
end


# p john.room

p blue_room.patients.first.room.patients.first
# instance blue room



CSV.open(csv....) do |csv|
  repo.patients.each do ...

  csv << [patient.name, patient.room....]
end
