class Listings
    attr_accessor :city
    @@all = []

    def initialize(city)
        @city = city
        @@all << self
    end

    def guests
        Trips.all.map { |trip| trip.guest if trip.listing == self }.compact
    end

    def trips
        Trips.all.map { |trip| trip if trip.listing == self }.compact
    end

    def trip_count
        self.trips.length
    end

    def self.all
        @@all
    end

    def self.find_all_by_city(city)
        @@all.select { |listing| listing.city == city }
    end

    def self.most_popular
        new_hash = {}
        Trips.all.each do |trip|
            if new_hash[trip.listing] != nil
                new_hash[trip.listing] += 1
            else
                new_hash[trip.listing] = 1
            end
        end
        new_hash.sort_by { |k,v| v}[-1]
    end
    
end