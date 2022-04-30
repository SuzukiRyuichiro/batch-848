require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class ScrapeService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    url = "https://www.allrecipes.com/search/results/?search=#{@keyword}"
    html_doc = URI.open(url).read
    # 3. parse the html
    parsed_html = Nokogiri::HTML(html_doc)
    # 4. find first five recipes in the results
    results = parsed_html.search('.card__detailsContainer').first(5).map do |card|
      name = card.search('.card__title').text.strip
      description = card.search('.card__summary').text.strip
      rating = card.search('.review-star-text').text.strip.split(' ')[1]

      # Look for 'a' tag that has the link to individual recipes
      recipe_url = card.search('.card__titleLink').first.attribute('href').value
      # Open the recipe page
      recipe_html = URI.open(recipe_url)
      # Parse it
      parsed_recipe_html = Nokogiri::HTML(recipe_html)
      # Look for the element that has prep time information
      prep_element = parsed_recipe_html.search('.recipe-meta-item').find do |element|
        element.text.strip.match?(/prep/i) # This will look for an element with text like "Prep ..."
      end
      prep_time = prep_element ? prep_element.text.strip.delete_prefix('prep: ') : nil
      Recipe.new(name, description, rating, prep_time)
    end

    return results
  end
end
