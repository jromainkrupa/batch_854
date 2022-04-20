require "amazing_print"
require_relative "titleize"
# welcome to the store
puts "Welcome to our shop."

# define what is in the store: hash
store = {
  kiwi: { price: 10},
  banana: { price: 12},
  mango: { price: 11},
  nutella: { price: 6}
}

def display(store)
  store.each do |key, value|
    puts "> #{titleize(key.to_s)}: #{value[:price]} €"
  end
end

# define user basket empty array
basket = []

# show user what is in the store with quantities and prices
display(store)

answer = nil

while answer != "q"
  # get user input
  puts "What do you want?"
  user_input = gets.chomp.downcase.strip.to_sym

  if store.include?(user_input)
    basket << { "#{user_input}": store[user_input] }

    basket.each do |hash|
      puts "> you have #{hash.keys[0].capitalize} in your basket"
    end
  else
    puts "Sorry this item doesn't not exist"
  end

  puts "Something else?"
  print ">"
  answer = gets.chomp
end

basket.each do |item|
  puts "> #{item.keys[0]}: #{item[item.keys[0]][:price]} €"
end

# if the item is exists
  # say it's exists
# otherwise add the chosen item to the basket array
# ask him again ....
# would like to proceed to payment
# calculate the items
# display the amount on the receipt
