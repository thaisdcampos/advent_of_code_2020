# frozen_string_literal: true

file = File.open('location_map.txt')
location_map = file.readlines.map(&:chomp!)

coordinate = 0
sum = 0
location_map.drop(1).each do |location|
  coordinate += right

  map_part = location * coordinate
  sum += 1 if map_part[coordinate] == '#'
end

puts "#{sum} three found(s)"
