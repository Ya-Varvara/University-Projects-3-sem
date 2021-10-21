require './main'

puts 'Hello world!'
puts 'Введите значение x'
x = gets.chomp.to_f
puts 'Введите значение z'
z = gets.chomp.to_f

if calculate(x, z)
  puts "y = #{calculate(x, z)}"
else
  puts "y не определен!"
end
