# frozen_string_literal: true

class Toboggan
  attr_reader :location_map, :right, :down

  def initialize(location_map, right, down)
    @location_map = location_map
    @right = right
    @down = down
  end

  def found_three
    coordinate = 0
    sum = 0
    location_map.drop(down).each_with_index do |location, index|
      next if index % down != 0

      coordinate += right

      map_part = location * coordinate
      sum += 1 if map_part[coordinate] == '#'
    end

    puts "#{sum} three found(s)"
    sum
  end
end

file = File.open('location_map.txt')
location_map = file.readlines.map(&:chomp!)
slopes = ['1,1', '3, 1', '5,1', '7, 1', '1, 2']

mult = 1
slopes.each do |slope|
  right, down = slope.split(',').map(&:to_i)
  amount = Toboggan.new(location_map, right, down).found_three

  mult *= amount
end

p "#{mult} threes on slopes"
