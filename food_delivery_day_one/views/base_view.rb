class BaseView
  def display(items)
    items.each do |item|
      puts item.to_s
    end
  end

  def ask_for(stuff)
    puts "#{stuff} ?"
    print "> "
    return gets.chomp
  end
end
