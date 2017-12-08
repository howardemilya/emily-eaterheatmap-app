require_relative "../lib/scraper.rb"
require_relative "../lib/city.rb"
require_relative "../lib/restaurant.rb"
require 'nokogiri'

class CommandLineInteface

  def run
    greet_user
    sleep(3)
    list_cities
    city_array = Scraper.scrape_cities_page(CITY_WEBSITE)
    City.create_from_collection(city_array)
    input = gets.strip
    wanted_city = City.find_by_id(input)
    binding.pry
    wanted_city.add_city_restaurant_url
    rest_array = Scraper.scrape_restaurant_list_page(wanted_city.restaurant_url)
    Restaurant.create_from_collection(rest_array)
    Restaurant.all
  end

  CITY_WEBSITE = "https://www.eater.com/cities-directory"

  def greet_user
    puts "Welcome to your local restaurant hot list!"
    sleep(3)
    puts "Please enter the number for the city you are interested in:"
  end

  def list_cities
    scraped_cities = Scraper.scrape_cities_page(CITY_WEBSITE)
    scraped_cities.each_with_index do |city, i|
      puts "#{i + 1}. #{city}"
    end
  end



  #url list


end
