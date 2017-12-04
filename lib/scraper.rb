require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_cities_page(index_url)
    scrape = Nokogiri::HTML(open(index_url))
    scraped_cities = []

    scrape.css("").each do |city|
      city = {
        :name => city.css("")
      }
      scraped_cities << city
    end
    scraped_cities
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
