require 'pry'

class Restaurant

  attr_accessor :name, :location, :description

  @@all = []

  def initialize(name:, location:, description:)
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
