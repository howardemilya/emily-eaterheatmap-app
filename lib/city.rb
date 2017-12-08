require 'pry'

class City

  attr_accessor :name, :id, :restaurant_url

  @@all = []

  def initialize(name, id)
    @name = name
    @id = id
    @restaurant_url = restaurant_url
    @restaurants = []
    @@all << self
  end

  def self.create_from_collection(city_array)
    city_array.each_with_index do |city, i|
      City.new(city, i+1)
    end
  end

  def self.find_by_id(id)
    @@all.detect {|c| c.id == id}
  end

  def add_restaurant(restaurant)
    @restaurants << restaurant
  end

  def restaurants
    @restaurants.each_with_index do |r, i|
      puts "#{i+1}. #{r.name}, #{r.location}"
    end
  end

  def add_city_restaurant_url
    if city.name == "Atlanta"
      city.restaurant_url = "https://atlanta.eater.com/maps/best-new-restaurants-atlanta-heatmap"
    elsif city.name == "Austin"
      city.restaurant_url = "https://austin.eater.com/maps/best-new-restaurants-austin-heatmap"
    elsif city.name == "Boston"
      city.restaurant_url == "https://boston.eater.com/maps/best-new-boston-restaurants-heatmap"
    elsif city.name == "Charleston"
      city.restaurant_url = "https://charleston.eater.com/maps/best-new-charleston-restaurants"
    elsif city.name == "Chicago"
      city.restaurant_url = "https://chicago.eater.com/maps/best-new-chicago-restaurants-heatmap"
    elsif city.name == "Dallas"
      city.restaurant_url = "https://dallas.eater.com/maps/dallas-best-new-restaurants-heatmap"
    elsif city.name == "Denver"
      city.restaurant_url = "https://denver.eater.com/maps/best-new-denver-restaurants-heatmap"
    elsif city.name == "Detroit"
      city.restaurant_url = "https://detroit.eater.com/maps/best-new-restaurants-detroit-heatmap"
    elsif city.name == "Houston"
      city.restaurant_url = "https://houston.eater.com/maps/houston-best-new-restaurants-heatmap"
    elsif city.name == "Las Vegas"
      city.restaurant_url = "https://vegas.eater.com/maps/map-best-new-las-vegas-restaurants-heatmap"
    elsif city.name == "London"
      city.restaurant_url = "https://london.eater.com/maps/best-new-restaurants-london-heatmap"
    elsif city.name == "Los Angeles"
      city.restaurant_url = "https://la.eater.com/maps/best-new-restaurants-los-angeles-heatmap"
    elsif city.name == "Miami"
      city.restaurant_url = "https://miami.eater.com/maps/best-new-restaurants-miami-heatmap"
    elsif city.name == "Montreal"
      city.restaurant_url = "https://montreal.eater.com/maps/best-new-restaurants-montreal-heatmap"
    elsif city.name == "Nashville"
      city.restaurant_url = "https://nashville.eater.com/maps/best-new-nashville-restaurants-heatmap"
    elsif city.name == "New Orleans"
      city.restaurant_url = "https://nola.eater.com/maps/best-new-new-orleans-restaurants-heatmap"
    elsif city.name == "New York"
      city.restaurant_url = "https://ny.eater.com/maps/best-new-nyc-restaurants-heatmap"
    elsif city.name == "Philadelphia"
      city.restaurant_url = "https://philly.eater.com/maps/best-new-restaurants-philadelphia-heatmap"
    elsif city.name == "Portland, OR"
      city.restaurant_url = "https://pdx.eater.com/maps/best-new-portland-restaurants-heatmap"
    elsif city.name == "San Diego"
      city.restaurant_url = "https://sandiego.eater.com/maps/best-new-san-diego-restaurants-heatmap"
    elsif city.name == "San Francisco"
      city.restaurant_url = "https://sf.eater.com/maps/best-new-restaurants-san-francisco-oakland-berkeley-heatmap"
    elsif city.name == "Seattle"
      city.restaurant_url = "https://seattle.eater.com/maps/best-new-seattle-restaurants-heatmap"
    elsif city.name == "Twin Cities"
      city.restaurant_url = "https://twincities.eater.com/maps/best-new-restaurants-minneapolis-st-paul"
    else city.name == "Washington DC"
      city.restaurant_url = "https://dc.eater.com/maps/best-new-dc-restaurants-heatmap"
    end
  end


end
