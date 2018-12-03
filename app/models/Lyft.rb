require 'pry'

class Ride
  attr_accessor :distance, :driver, :passenger
  @@all = []

  def initialize(passenger, driver, distance)
    @passenger = passenger
    @driver = driver
    @distance = distance
    @@all << self
  end

  def self.all
    @@all
  end

  def self.average_distance
    ave_array = self.all.collect do |ride|
      ride.distance
    end
    ave_distance = ave_array.inject(:+) / ave_array.size
    ave_distance
  end

end

########## Person Class #########
class Passenger
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_ride(driver, distance)
    Ride.new(self, driver, distance)
  end

  def self.all
    @@all
  end

  def rides
    Ride.all.select do |ride|
      ride.passenger == self
    end
  end

  def drivers
    self.rides.collect do |ride|
      ride.driver
    end
  end

  def total_distance
    total_array = self.rides.collect do |ride|
       ride.distance
    end
    total_array.inject(:+)
  end

  def self.premium_members(distance)
    hash = {}
    Ride.all.select do |ride|
      if hash[ride.passenger]
        hash[ride.passenger] += ride.distance
      else
        hash[ride.passenger] = ride.distance
      end
      hash
    end
    hash.select do |driver, miles|
      driver if miles >= distance
    end
  end

end

######### Driver Class ########

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
  end


  def self.mileage_cap(distance)
    hash = {}
    Ride.all.collect do |ride|
      if hash[ride.driver]
        hash[ride.driver] += ride.distance
      else
        hash[ride.driver] = ride.distance
      end
      hash
    end
    hash.select do |driver, miles|
      driver if miles > distance
    end
  end

end

max = Driver.new("Max")
john = Driver.new("John")

joe = Passenger.new("Joe")
adam = Passenger.new("Adam")

to_dc = joe.new_ride(max, 6.9)
to_club = joe.new_ride(john, 5.4)
to_home = adam.new_ride(max, 9.8)

joe.total_distance
max.passengers
