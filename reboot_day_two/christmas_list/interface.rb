require "amazing_print"
require "csv"
require_relative "scraper"

puts "\n"
puts "*" * 31
puts "*" + " " * 29 + "*"
puts "*  Welcome to Christmas List  *"
puts "*" + " " * 29 + "*"
puts "*" * 31
# on initialise la christmas list avec un item dedans.
# la data structure est un tableau de Hash.
# plus facilement modifiable pour les prochaines features
def load_csv
  results = []
  CSV.foreach("products.csv", headers: :first_row, quote_char: '"') do |row|
    name = row["name"]
    status = row["status"] == "true"
    price = row["price"].to_i

    results << { name: name, status: status, price: price}
  end
  return results
end

christmas_list = load_csv

# méthode pour afficher la christmas list à l'utilisateur
def display_list(christmas_list)
  christmas_list.each_with_index do |gift, index|
    status = gift[:status] ? "[X]" : "[ ]"
    puts "#{index + 1}. #{status} - #{gift[:name]} at #{gift[:price]} €"
  end
end

# méthode pour afficher les actions à l'utilisateur
def display_actions
  puts "What do you want to do?"
  puts "1. Add an item"
  puts "2. Remove an item"
  puts "3. Display the list"
  puts "4. Mark as bought"
  puts "5. Find ideas on Etsy"
  puts "6. Quit"
end

# on init la variable answer pour rentrer dans la boucle until
answer = nil

until answer == "quit"
  display_actions
  print ">"
  answer = gets.chomp

  case answer
  when "1"
    puts "What do you want to add?"
    print ">"
    name = gets.chomp

    puts "What is the price?"
    print ">"
    price = gets.chomp.to_i

    # on ajoute l'item dans la christmas list
    christmas_list << { name: name, status: false, price: price }

  when "2"
    # on affiche la list au user
    display_list(christmas_list)

    # on prend l'index de l'item que l'utilisateur souhaite supprimer
    puts "Wich item would you like to delete?"
    print ">"
    item_to_delete_index = gets.chomp.to_i - 1

    # on stock le nom de l'item supprimer
    item_removed_name = christmas_list[item_to_delete_index][:name]

    # on supprime l'item de la chrismas_list
    christmas_list.delete_at(item_to_delete_index)
    puts "#{item_removed_name} has been successsfully remove!"

  when "3"
    display_list(christmas_list)

  when "4"
    # not_mark_list = christmas_list.select { |item| item[:status] == false }
    # # ap not_mark_list
    display_list(christmas_list)
    puts "Wich item would you like to mark as buy ?"
    print ">"
    mark_index = gets.chomp.to_i - 1
    if christmas_list[mark_index][:status]
      puts "already set as marked"
    else
      christmas_list[mark_index][:status] = true
    end

    display_list(christmas_list)

  when "5"
    # On demande au user ce qu'il souhaite chercher sur etsy
    puts "What do you want to search on Esty"
    # on mets son souhait dans une variable
    print ">"
    wish = gets.chomp
    # On construit l'url de recherche sur ETSY avec le mot clès de l'utilisateur
    url = "https://www.etsy.com/fr/search?q=#{wish}"

    # on scrappe ???
    # le resultat du scrappe est un tableau de items (des hashs...) on le met dans un variable
    etsy_results = scrape_etsy(url)

    # on l'affiche au user
    display_list(etsy_results)
    # on lui demande quel item il souhaite ajouter a sa list
    puts "Wich item would you like to add to your christmas list?"
    print ">"
    wish_index = gets.chomp.to_i - 1

    # on ajoute l'item choisi
    christmas_list << etsy_results[wish_index]


  when "6"
    CSV.open("products.csv", "wb", quote_char: '"') do |csv|
      csv << ["name", "status", "price"]
      christmas_list.each do |item|
        csv << [item[:name],item[:status],item[:price]]
      end
    end
    answer = "quit"
  end
end
