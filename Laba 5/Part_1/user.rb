# frozen_string_literal: true

require './main'

puts 'Введите значение x'
x = gets.chomp
puts 'Введите значение z'
z = gets.chomp

if calculate(x, z)
  puts "y = #{calculate(x, z)}"
else
  puts 'y не определен!'
end
