require 'open-uri'
require 'nokogiri'
require 'amazing_print'

def fetch_movie_urls
  url =  "https://www.imdb.com/chart/top"
  html_file = URI.open(url).read
  doc = Nokogiri::HTML(html_file)
  movies = doc.search(".titleColumn a")
  movies.take(5).map do |movie|
    "https://www.imdb.com#{movie.attributes["href"].value}"
  end
end

def scrape_movie(url)
  html_file = URI.open(url, "Accept-Language" => "en-US").read
  doc = Nokogiri::HTML(html_file)
  title = doc.search('h1').text.strip
  ap doc.search('.sc-16ede01-0').first.text

end
