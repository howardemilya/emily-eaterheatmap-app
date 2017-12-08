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

  def self.create_from_collection(restaurant_array)
    restaurant_array.each do |restaurant|
      Restaurant.new(restaurant)
    end
  end

  def self.all
    @@all.each_with_index do |r, i|
      puts "#{i+1}. #{r.name}, #{r.location}"
    end
  end



end
