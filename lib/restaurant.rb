require 'pry'

class Restaurant

  attr_accessor :name, :location, :description

  @@all = []

  def initialize(restaurant_hash)
    @name = name
    @location = location
    @description = description
    @@all << self
  end
  



end
