require 'pry'


class Passenger
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all = self
  end

  def new_ride(driver, distance)
    Ride.new(self, driver, distance)
  end

  def self.all
    @@all
  end

end



class Ride
  attr_accessor :passenger, :driver, :distance
  @@all = []

  def initialize(passenger, driver, distance)
    @distance = distance
    @passenger = passenger
    @driver = driver
    @@all << self
  end

  def self.all
    @@all
  end

  def self.average_distance
    distance_array = self.all.collect do |ride|
      ride.distance
    end
    ave_distance = distance_array.inject(:+)
    ave_distance
  end

end



class Driver
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def rides
    Ride.all.select do |ride|
      ride.driver == self
    end
  end

  def passengers
    self.rides.collect do |ride|
      ride.passenger
    end
    # Ride.all.select do |ride|
    #   ride.passenger if ride.driver == self
    # end
  end


end
