require_relative "helpers/argument_helper.rb"
require_relative "models/driver.rb"
require_relative "models/trip.rb"
require "time"

include ArgumentHelper

args = ARGV

if (ArgumentHelper.has_invalid_arguments(args))    
    puts "USAGE: ruby process_driver_file.rb <filename>" 
elsif (ArgumentHelper.should_display_help(args)) 
    puts "Process a file of driving history"
    puts 
    puts "ruby process_driver_file <filename>"
    puts 
    puts "\t<filename>   Specifies the file to process."
else
    filename = ArgumentHelper.get_filename(args)

    puts "Processing file #{filename}"

    drivers = []

    File.open(filename).each do |line|
        segments = line.split(" ")

        if line.match(/^driver/i)
            drivers << Driver.new(segments[1])
        end

        if line.match(/^trip/i)
            driver = drivers.find { |d| d.name == segments[1] }
            trip = Trip.new(Time.parse(segments[2]), Time.parse(segments[3]), segments[4].to_f)
            driver.add_trip(trip) if trip.is_valid
        end
    end

    sorted_drivers = drivers.sort_by(&:total_miles_driven).reverse

    sorted_drivers.each do |driver|
        text = driver.name + ": #{driver.total_miles_driven.to_i} miles"

        text += " @ #{driver.total_miles_per_hour.ceil(0)} mph" if driver.total_miles_driven > 0

        puts text
    end
end
