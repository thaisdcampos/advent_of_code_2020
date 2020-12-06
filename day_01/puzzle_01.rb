# frozen_string_literal: true

file = File.open('input_01.txt')
numbers = file.readlines.map(&:to_i)
combination = numbers.combination(2).to_a

combination2020 = []
combination.map do |pair|
  sum_result = pair.inject(:+)
  combination2020 << pair if sum_result == 2020
end

puts "Combine = #{combination2020}"

result = combination2020.flatten.inject(:*)

puts "Result = #{result}"
