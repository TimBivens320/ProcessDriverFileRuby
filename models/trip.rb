class Trip
    attr_reader :start_time
    attr_reader :end_time
    attr_reader :miles_driven

    def initialize(start_time, end_time, miles_driven)
        @start_time = start_time
        @end_time = end_time
        @miles_driven = miles_driven
    end

    def elapsed_time
        ((end_time - start_time) / 3600)
    end

    def is_valid
        miles_per_hour = miles_driven / elapsed_time
        return miles_per_hour >= 5 && miles_per_hour <= 100
    end
end
