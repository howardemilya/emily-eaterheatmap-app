require 'pry'

class Restaurant

  attr_accessor :name, :location, :description, :city

  @@all = []

  def initialize(name:, location:, description:)
    @name = name
    @location = location
    @description = description
    @@all << self
  end

  def self.create_from_collection(restaurant_array, city)
    restaurant_array.each do |restaurant|
      r = Restaurant.new(restaurant)
      r.city = city
    end
  end

  def self.all
    @@all.each do |rest|
      puts "#{rest.name}"
    end
  end

  def self.find_by_id(number)
    @@all[number - 1]
  end

  def details
    puts "#{@name} is located at #{@location}."
    puts "#{@description}"
  end




end
