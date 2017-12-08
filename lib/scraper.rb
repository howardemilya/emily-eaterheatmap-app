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
    scraped_cities.each_with_index do |city, i|
      puts "#{i + 1}. #{city}"
    end
  end

  def self.scrape_restaurant_list_page(city_url)
    restaurantinfo = Nokogiri::HTML(open(city_url))
    scraped_restaurants = {}

    restaurantinfo.css("").each do |restaurant|
      restaurant = {
        :name => restaurant.css(),
        :location => restaurant.css(),
        :description => restaurant.css()
      }
      scraped_restaurants << restaurant
    end
    scraped_restaurants
  end

end
