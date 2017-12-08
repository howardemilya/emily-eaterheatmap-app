require_relative "../lib/scraper.rb"
require_relative "../lib/city.rb"
require_relative "../lib/restaurant.rb"
require 'nokogiri'

class CommandLineInteface

  def run
    greet_user
    sleep(3)
    list_cities
  end

  CITY_WEBSITE = "https://www.eater.com/cities-directory"

  def greet_user
    puts "Welcome to your local restaurant hot list!"
    sleep(3)
    puts "Please enter the number for the city you are interested in:"
  end

  def list_cities
    Scraper.scrape_cities_page(CITY_WEBSITE)
  end



end
