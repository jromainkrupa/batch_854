require "pry-byebug"
require_relative "car"

def normalize(word)
  word.strip.capitalize
end

def full_name(first_name, last_name)
  binding.pry
  first_name = normalize(first_name)
  last_name = normalize(last_name)

  "#{first_name} #{last_name}"
end

puts full_name("   JeaN", " KRuPa        ")
# => Jean Krupa
