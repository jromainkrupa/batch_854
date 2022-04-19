require "open-uri"
require "nokogiri"

def scrape_etsy(url)
  ap url
  # on va sur le site
  doc = URI.open(url).read
  nokogiri_document = Nokogiri::HTML(doc)
  results = []
  nokogiri_document.search(".v2-listing-card__info").take(5).each do |element|
    name = element.search(".v2-listing-card__title").text.strip
    price = element.search(".currency-value").text.strip
    results << { name: name, price: price, status: false }
  end
  return results
end
