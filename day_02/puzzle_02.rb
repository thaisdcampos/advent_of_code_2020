# frozen_string_literal: true

file = File.open('password_policy.txt')
password_policy = file.readlines.map(&:chomp!)

sum = 0
password_policy.each do |password|
  occurences, character, word = password.split
  lowest, highest = occurences.split('-')
  therm = character.chomp!(':')

  sum += 1 if word.count(therm).between?(lowest.to_i, highest.to_i)
end

puts "Sum = #{sum}"
