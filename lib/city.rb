require 'pry'

class City

  attr_accessor :name

  def initialize(name)
    @name = name
    @restaurants = []
  end

  def add_restaurant(restaurant)
    @restaurants << restaurant
  end

  def restaurants
    @restaurants.each_with_index do |r, i|
      puts "#{i+1}. #{r.name}, #{r.location}"
    end
  end


end
