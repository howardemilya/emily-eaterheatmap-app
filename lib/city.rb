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

  def self.all
    @@all
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
    if @name == "Atlanta"
      @restaurant_url = "https://atlanta.eater.com/maps/best-new-restaurants-atlanta-heatmap"
    elsif @name == "Austin"
      @restaurant_url = "https://austin.eater.com/maps/best-new-restaurants-austin-heatmap"
    elsif @name == "Boston"
      @restaurant_url == "https://boston.eater.com/maps/best-new-boston-restaurants-heatmap"
    elsif @name == "Charleston"
      @restaurant_url = "https://charleston.eater.com/maps/best-new-charleston-restaurants"
    elsif @name == "Chicago"
      @restaurant_url = "https://chicago.eater.com/maps/best-new-chicago-restaurants-heatmap"
    elsif @name == "Dallas"
      @restaurant_url = "https://dallas.eater.com/maps/dallas-best-new-restaurants-heatmap"
    elsif @name == "Denver"
      @restaurant_url = "https://denver.eater.com/maps/best-new-denver-restaurants-heatmap"
    elsif @name == "Detroit"
      @restaurant_url = "https://detroit.eater.com/maps/best-new-restaurants-detroit-heatmap"
    elsif @name == "Houston"
      @restaurant_url = "https://houston.eater.com/maps/houston-best-new-restaurants-heatmap"
    elsif @name == "Las Vegas"
      @restaurant_url = "https://vegas.eater.com/maps/map-best-new-las-vegas-restaurants-heatmap"
    elsif @name == "London"
      @restaurant_url = "https://london.eater.com/maps/best-new-restaurants-london-heatmap"
    elsif @name == "Los Angeles"
      @restaurant_url = "https://la.eater.com/maps/best-new-restaurants-los-angeles-heatmap"
    elsif @name == "Miami"
      @restaurant_url = "https://miami.eater.com/maps/best-new-restaurants-miami-heatmap"
    elsif @name == "Montreal"
      @restaurant_url = "https://montreal.eater.com/maps/best-new-restaurants-montreal-heatmap"
    elsif @name == "Nashville"
      @restaurant_url = "https://nashville.eater.com/maps/best-new-nashville-restaurants-heatmap"
    elsif @name == "New Orleans"
      @restaurant_url = "https://nola.eater.com/maps/best-new-new-orleans-restaurants-heatmap"
    elsif @name == "New York"
      @restaurant_url = "https://ny.eater.com/maps/best-new-nyc-restaurants-heatmap"
    elsif @name == "Philadelphia"
      @restaurant_url = "https://philly.eater.com/maps/best-new-restaurants-philadelphia-heatmap"
    elsif @name == "Portland, OR"
      @restaurant_url = "https://pdx.eater.com/maps/best-new-portland-restaurants-heatmap"
    elsif @name == "San Diego"
      @restaurant_url = "https://sandiego.eater.com/maps/best-new-san-diego-restaurants-heatmap"
    elsif @name == "San Francisco"
      @restaurant_url = "https://sf.eater.com/maps/best-new-restaurants-san-francisco-oakland-berkeley-heatmap"
    elsif @name == "Seattle"
      @restaurant_url = "https://seattle.eater.com/maps/best-new-seattle-restaurants-heatmap"
    elsif @name == "Twin Cities"
      @restaurant_url = "https://twincities.eater.com/maps/best-new-restaurants-minneapolis-st-paul"
    else @name == "Washington DC"
      @restaurant_url = "https://dc.eater.com/maps/best-new-dc-restaurants-heatmap"
    end
  end


end
