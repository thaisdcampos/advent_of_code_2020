# frozen_string_literal: true

ARGV.each do |combination_number|
  puts "Number of combination: #{combination_number}"

  file = File.open('input_01.txt')
  numbers = file.readlines.map(&:to_i)
  combination = numbers.combination(combination_number.to_i).to_a

  combination2020 = []
  combination.map do |pair|
    sum_result = pair.inject(:+)
    combination2020 << pair if sum_result == 2020
  end

  puts "Combine = #{combination2020}"

  result = combination2020.flatten.inject(:*)

  puts "Result = #{result}"
end
