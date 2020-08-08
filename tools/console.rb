require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


guest1 = Guests.new("John")
guest2 = Guests.new("Sam")
guest3 = Guests.new("Olivia")
listing1 = Listings.new("Dallas")
listing2 = Listings.new("New York")
listing3 = Listings.new("San Fran")

trip1 = Trips.new(guest1, listing1)
trip2 = Trips.new(guest2, listing2)
trip3 = Trips.new(guest3, listing3)

Pry.start
