# frozen_string_literal: true

file = File.open('passaports.txt')
passaports = file.readlines.map(&:chomp!)

REQUIRED_FIELDS = %w[byr iyr eyr hgt hcl ecl pid cid].freeze

passaports_hash = {}
documents = []
sum = 0
(passaports + ['']).map do |passaport|
  if passaport.empty?
    fields = documents.each { |document| document.split(/\s/) }
    fields.each do |field|
      key, value = field.split(':')
      passaports_hash[key] = value
    end

    remaining_fields = (REQUIRED_FIELDS - passaports_hash.keys)
    valid = remaining_fields.empty? || remaining_fields.eql?('cid')
    documents.clear

    sum += 1 if valid
  else
    documents << passaport
  end
end

puts "#{sum} passaport(s) valid"
