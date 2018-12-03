require 'bundler/setup'
Bundler.require
require_all 'app'

joe = Passenger.new("Joe")
ty = Passenger.new("Ty")

jp = Driver.new("JP")
dan = Driver.new("Dan")

trip1 = joe.new_ride(jp, 11.3)
trip2 = ty.new_ride(jp, 8.4)
trip3 = joe.new_ride(dan, 6.9)

# jp.rides
jp.passengers
binding.pry
"hi"
