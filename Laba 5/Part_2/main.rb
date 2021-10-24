def ChangeString(str, arr_words)
  str.gsub!(/#+\w+#+/) { |m| m = arr_words.shift()}
end
