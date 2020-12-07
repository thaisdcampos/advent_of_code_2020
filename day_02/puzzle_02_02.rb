# frozen_string_literal: true
file = File.open('password_policy.txt')
passwords = file.readlines.map(&:chomp!)

sum = 0
passwords.each do |password|
  occurences, character, word = password.split
  first, second = occurences.split('-').map(&:to_i)
  therm = character.chomp!(':')

  sum +=1 if (word[first-1] == therm) ^ (word[second-1] == therm)
end

puts "Sum = #{sum}"

