# frozen_string_literal: true

def ChangeString(str, arr_words)
  str.gsub!(/#+\w+#+/) { |word| word = arr_words.shift }
end
