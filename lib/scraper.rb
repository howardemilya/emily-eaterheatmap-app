require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_cities_page(index_url)

    scrape = Nokogiri::HTML(open(index_url))
    scraped_cities = []
    # binding.pry
    scrape.css("h2").each do |city|
      scraped_cities << city.text
    end
    scraped_cities
  end

  def self.scrape_restaurant_list_page(city_url)
    restaurantinfo = Nokogiri::HTML(open(city_url))
    scraped_restaurants = []

    restaurantinfo.css("section.c-mapstack__card").each do |restaurant|
      restaurant = {
        :name => restaurant.css("h2").text.gsub("\n", ""),
        :location => restaurant.css("div.c-mapstack__address").text,
        :description => restaurant.css("div.c-entry-content p").text
      }
      scraped_restaurants << restaurant
    end
    restaurant_list = scraped_restaurants.select {|h| h[:location] != ""}
    binding.pry
    restaurant_list
  end

end
