# create files for your ruby classes in this directory
class Listing
  attr_accessor :city
  @@all = []

  def initialize(city)
    @city = city
    @@all << self
  end

  def self.all
    @@all
  end

  def guests
    Trip.all.select do |guests|
      guests
    end
  end

end

class Trip
  attr_accessor :guest, :listing
  @@all = []

  def initialize(guest, listing)
    @guest = guest
    @listing = listing
    @@all << self
  end

  def self.all
    @@all
  end

end


class Guest
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_trip(listing)
    Trip.new(self, listing)
  end

  def listings
    user_trips = Trip.all.select do |trips|
      trip.guest == self
    end
    user_listings = user_trips.collect do |user_list|
      user_list.listing
    end
    user_listings
  end

  def trips
   user_trips = Trip.all.select do |trips|
     trips.guest == self
   end
   end

   def trip_count
     trips.count
   end

end
