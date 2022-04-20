def list(gifts)
  gifts.each_with_index do |gift, index|
    # condition ? code if true : code if false
    status = gift[:bought] ? "[x]" : "[ ]"
    puts "#{index + 1} - #{status} #{gift[:name]} / #{gift[:price]}$"
  end
end

def scrape_etsy(keyword)
  # forge the URL
  url = "https://www.etsy.com/search?q=#{keyword}"
  # open the URL
  response = URI.open(url).read
  # convert the response into a Nokogiri document
  html_doc = Nokogiri::HTML(response)
  # search in the doc each element with class ".v2-listing-card__info'
  # initialize a etsy_gifts array
  etsy_gifts = []
  html_doc.search(".v2-listing-card__info").each do |element|
    # get item name
    etsy_name = element.search(".text-body").text.strip
    # get item price
    etsy_price = element.search(".currency-value").text.strip.to_i
    # create a gift with those information
    etsy_gifts << {name: etsy_name, price: etsy_price}
  end
  # return an array of hashes
  etsy_gifts
end

def load_csv
  filepath = File.join(__dir__, "gifts.csv")
  gifts = []

  CSV.foreach(filepath, headers: :first_row) do |row|
    gift = {name: row["name"], price: row["price"].to_i, bought: row["bought"] == "true"}
    gifts << gift
  end
  gifts
end

def save_csv(gifts)
  filepath = "gifts.csv"

  CSV.open(filepath, "wb", col_sep: ",", force_quotes: true, quote_char: '"') do |csv|
    csv << ["name", "price", "bought"]

    gifts.each do |gift|
      csv << [gift[:name], gift[:price], gift[:bought]]
    end
  end
end
