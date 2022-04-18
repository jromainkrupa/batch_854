def calculator(first_number, second_number, operation)
  if operation == "+"
    first_number.to_i + second_number.to_i
  elsif operation == "-"
    puts "fait une soustaction"
    first_number.to_i - second_number.to_i
  elsif operation == "/"
    puts "fait une division"
    first_number.to_f / second_number.to_i
  elsif operation == "*"
    puts "multipli"
    first_number.to_i * second_number.to_i
  else
    "sorry something went wrong"
  end
end
