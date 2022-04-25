require_relative "recipe"
require 'open-uri'
require 'nokogiri'

class ScraperService
  def initialize(ingredient)
    @ingredient = ingredient

  end

  def call
    url = "https://www.allrecipes.com/search/results/?search=#{@ingredient}"
    html_doc = URI.open(url).read
    doc = Nokogiri::HTML(html_doc)
    results = []
    doc.search('.card__detailsContainer').take(5).each do |element|
      name = element.search('.card__title').text.strip
      description = element.search('.card__summary').text.strip
      rating = element.search(".review-star-text").text.strip.match(/(\d.\d|\d)/)[1].to_f

      # chopper l'url du produit
      url = element.search('.card__titleLink').attribute("href").value
      # aller sur la page
      html_doc = URI.open(url).read
      doc = Nokogiri::HTML(html_doc)

      # chopper le preptime
      container = doc.search(".recipe-meta-container")
      prep_time_el = container.search(".recipe-meta-item").find do |item|
        item.text.strip.match?(/prep:/i)
      end
      prep_time = prep_time_el.nil? ? "_" : prep_time_el.text.strip.match(/(\d{2}|\d{1})/)[1]

      results << Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    end
    return results

  end
end
