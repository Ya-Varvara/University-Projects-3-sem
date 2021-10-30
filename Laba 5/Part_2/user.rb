# frozen_string_literal: true

require './main'

puts 'Print string else print 0 to stop the program'
text = []
loop do
  str = gets.chomp
  break if str == '0'

  text << str unless str.empty?
end

puts 'Original strings:'
puts text

text.each do |st|
  arr_words = []
  st.scan(/#+\w+#+/).size.times do
    puts 'Input word for change'
    arr_words << gets.chomp
  end
  ChangeString(st, arr_words)
end

puts 'Fixed strings:'
puts text
