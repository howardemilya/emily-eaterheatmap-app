require_relative "../lib/scraper.rb"
require_relative "../lib/city.rb"
require_relative "../lib/restaurant.rb"
require 'nokogiri'

class CommandLineInteface

  def run
    greet_user
    sleep(1)
    create_cities
    run_loop
  end

  def run_loop
    list_cities
    sleep(2)
    select_city
    create_restaurants
    add_restaurant_to_city
    sleep(1)
    restaurant_loop
    sleep(2)
  end

  def ask_what_to_do
    input = gets.strip
    if input == "exit"
      nil
    else
      if input == "new city"
        clear_restaurants
        run_loop
      else
        restaurant_loop
      end
    end
  end

  def restaurant_loop
    list_restaurants
    restaurant_details
    puts "Type 'exit' to quit or 'more' to keep exploring this city"
    puts "Type 'new city' to switch to another location"
    ask_what_to_do
  end

  CITY_WEBSITE = "https://www.eater.com/cities-directory"

  def greet_user
    puts "Welcome to your local restaurant hot list!"
    sleep(3)
    puts "Please enter the number for the city you are interested in:"
  end

  def create_cities
    @scraped_cities = Scraper.scrape_cities_page(CITY_WEBSITE)
    City.create_from_collection(@scraped_cities)
  end

  def list_cities
    City.all.each do |city|
      puts "#{city.id}. #{city.name}"
    end
  end

  def select_city
    input = gets.strip
    @wanted_city = City.find_by_id(input.to_i)
    @wanted_city.add_city_restaurant_url
    sleep(1)
    puts "Great! You chose #{@wanted_city.name}!"
    puts "Here is a short list of the hottest restaurants in #{@wanted_city.name} right now:"
    sleep(2)
  end

  def create_restaurants
    rest_array = Scraper.scrape_restaurant_list_page(@wanted_city.restaurant_url)
    Restaurant.create_from_collection(rest_array, @wanted_city)
    # binding.pry
  end

  def add_restaurant_to_city
    Restaurant.all.each do |r|
      @wanted_city.add_restaurant(r)
    end
  end

  def list_restaurants
    sleep(1)
    # binding.pry
    @wanted_city.restaurants.each do |r|
      puts "#{r.name}"
    end
    puts "To learn more about a restaurant, please enter its number:"
  end

  def restaurant_details
    input = gets.strip
    @wanted_restaurant = Restaurant.find_by_id(input.to_i)
    puts "You selected #{@wanted_restaurant.name}"
    sleep(1)
    # binding.pry
    @wanted_restaurant.details
    sleep(5)
    puts " "
    puts "Would you like to exit or view another restaurant's info?"
  end

  def clear_restaurants
    @wanted_city.clear
    Restaurant.clear
  end

end
