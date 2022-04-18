require "amazing_print"
require_relative "calculator"

# think MVP

continue = "y"

while continue == "y"

  # ask the first number
  puts "Bonjour frérot"
  puts "Choisi un chiffre steuple"
  print ">"
  first_number = gets.chomp
  until first_number.match?(/^\d$/)
    puts "pas ouf tape un chiffre!"
    print ">"
    first_number = gets.chomp
  end

  # ask the operator
  puts "Choisi une opération (+, -, /, *)"
  print ">"
  operation = gets.chomp

  # ask the second number
  puts " deuxième chiffre steuplé"
  second_number = gets.chomp
  until first_number.match?(/^\d$/)
    puts "pas ouf tape un chiffre!"
    print ">"
    second_number = gets.chomp
  end

  result = calculator(first_number, second_number, operation)

  puts "Result: #{result}"

  puts 'tu veux continuer ou partir "y"/"n".'
  continue = gets.chomp
end

# puts " ADVANCE 🔥"
# puts "tape ton opération en séparant par des espaces ex: 1 + 1"
# operation = gets.chomp
# ap operation
# first_number, operation, second_number = operation.split(" ")
# result = first_number.to_i.send(operation.to_sym,  second_number.to_i)
