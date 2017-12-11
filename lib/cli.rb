require_relative "../lib/scraper.rb"
require_relative "../lib/city.rb"
require_relative "../lib/restaurant.rb"
require 'nokogiri'

class CommandLineInteface

  def run
    greet_user
    sleep(1.5)
    list_cities
    sleep(2)
    select_city
    sleep(1)
    list_restaurants
    restaurant_details
    puts "Type 'exit' to quit or 'more' to keep exploring"
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

  def select_city
    city_array = Scraper.scrape_cities_page(CITY_WEBSITE)
    City.create_from_collection(city_array)
    input = gets.strip
    @wanted_city = City.find_by_id(input.to_i)
    @wanted_city.add_city_restaurant_url
    sleep(1)
    puts "Great! You chose #{@wanted_city.name}!"
  end

  def list_restaurants
    puts "Here is a short list of the hottest restaurants in #{@wanted_city.name} right now:"
    sleep(2)
    rest_array = Scraper.scrape_restaurant_list_page(@wanted_city.restaurant_url)
    Restaurant.create_from_collection(rest_array)
    # binding.pry
    Restaurant.all
    puts "To learn more about a restaurant, please enter its number:"
  end

  def restaurant_details
    input = gets.strip
    @wanted_restaurant = Restaurant.find_by_id(input.to_i)
    puts "You selected #{@wanted_restaurant.name}"
    sleep(1)
    # binding.pry
    @wanted_restaurant.details
    sleep(3)
    puts "Would you like to exit or view another restaurants info?"
  end

end
