class Guests
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def listings
        Trips.all.map { |trip| trip.listing if trip.guest == self }.compact
    end

    def trips
        Trips.all.map { |trip| trip if trip.guest == self }.compact
    end

    def trip_count
        self.trips.length
    end

    def self.all
        @@all
    end

    def self.pro_traveller
        new_hash = {}
        Trips.all.each do |trip|
            if new_hash[trip.guest] != nil
                new_hash[trip.guest] += 1
            else
                new_hash[trip.guest] = 1
            end
        end
        new_hash.map { |guest| guest[0] if guest[1] > 1 }.compact
    end

    def self.find_all_by_name(name)
        @@all.map { |guest| guest if guest.name == name }.compact
    end

end