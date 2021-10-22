# word =~/^#.+(#$)/

def fix_str(str)
  str.gsub!(/#\w+#/) do |m|
    puts "Input word"
    m = gets.chomp
  end
end