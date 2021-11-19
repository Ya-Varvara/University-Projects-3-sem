# frozen_string_literal: true

def change_string(str, arr_words)
  str.gsub(/#+\w+#+/) { arr_words.shift }
end
