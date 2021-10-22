require './main'

puts "Print string else print 0 to stop the program"
text = []
while true do
  str = gets.chomp!
  break if str == '0'
  text << str unless str.empty?
end

puts "Original strings:"
puts text

text.each { |str| fix_str(str) }

puts "Fixed strings:"
puts text