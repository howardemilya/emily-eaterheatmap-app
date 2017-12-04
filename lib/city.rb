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
    @restaurants
  end


end
