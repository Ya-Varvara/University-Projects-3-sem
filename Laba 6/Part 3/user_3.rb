require './main_3'

func = ->(x) { x * (x - 1) }

puts "Итеграл №1 (в виде передаваемого lambda-выражения ) -  #{intprg(0, 2, &func)}"
puts "Итеграл №2 (в виде блока) -  #{intprg(0, 1) { |x| Math.exp(x) / (x + 1) }}"
