require 'amazing_print'
# créer un array [chevaux]
horses = ["cocaine", "amphetamine","LSD", "ketamine", "weed"]

# on affiche les chevaux au user avec leur index
puts "horses today are:"
horses.each.with_index(1) do |horse, index|
  puts "#{index}. #{horse}"
end

answer = "y"

# on initialize la balance
balance = 100

while answer != "n"
# on demande au user un chiffre
puts "choisi le numéro de ton cheval"
print ">"
horse_index = gets.chomp.to_i - 1

# on choppe le cheval dans le tableau grâce au chiffre que le user a taper
# on met le cheval dans une variable
horse = horses[horse_index]

# on demande au user le montant du pari
puts "Combien souhaites tu parier ?"
print ">"
user_bet = gets.chomp.to_i

# si il a assez de sous cool sinon on lui dit ta pas de sous
if balance < user_bet
  puts "tu n'as pas assez de sous"
else
  # on effectue la course de manière aléatoire
  winner = horses.sample
  if winner == horse
    puts "bravo"
    balance += user_bet * 10
  else
    puts "dommage"
    balance -= user_bet
  end
end

puts "Est-ce que tu veux rejouer ? (y,n)"
answer = gets.chomp
end
