class Driver
    attr_reader :name
    attr_reader :trips

    def initialize(name)
        @name = name
        @trips = []
    end

    def add_trip(trip)
        @trips << trip
    end
    
    def total_miles_driven
        sum = 0
        trips.each { |t| sum += t.miles_driven }
        sum
    end

    def total_miles_per_hour
        total_elapsed_time = 0
        trips.each { |t| total_elapsed_time += t.elapsed_time }
        miles_per_hour = total_miles_driven / total_elapsed_time
    end
end
