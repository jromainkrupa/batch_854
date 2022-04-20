require 'csv'
require 'json'
require 'amazing_print'


filepath = "beatles.json"

# CSV.foreach(filepath, headers: :first_row) do |row|
#   ap row
#   puts " first name is #{row["first_name"]} last name is #{row["last_name"]} and plays #{row["instrument"]}"

# end


# CSV.open(filepath, "wb") do |csv|
#   csv << ["First Name", "Last Name", "Instrument"]
#   csv << ["John", "Lennon", "Guitar"]
#   csv << ["Toto", "McCartney", "Bass Guitar"]
# end

serialized_beatles = File.read(filepath)

ap serialized_beatles # String

puts "before serialize 🤞"

beatles = JSON.parse(serialized_beatles) # transform la string en Hash

ap beatles

puts "after serialized 🤞"
