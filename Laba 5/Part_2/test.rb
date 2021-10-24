require 'minitest/autorun'
require './main'

MIN_WORD_LEN = 5
MAX_WORD_LEN = MIN_WORD_LEN + 10
MIN_STRING_LEN = 3
MAX_STRING_LEN = MIN_STRING_LEN + 5
MIN_CHAR = 65
MAX_CHAR = MIN_CHAR + 26

def generate_random_char
  (MIN_CHAR + rand(MAX_CHAR - MIN_CHAR)).chr
end

def generate_random_word
  (0..MIN_WORD_LEN + rand(MAX_WORD_LEN - MIN_WORD_LEN)).map { generate_random_char }.join
end

def generate_random_string
  (0..MIN_STRING_LEN + rand(MAX_STRING_LEN - MIN_STRING_LEN)).map { generate_random_word }.join(" ");
end

def generate_array_and_str
  words_arr = []
  string_for_change = ""
  expected_string = ""
  random_string = generate_random_string
  random_string.split.each_with_index do |word, index|
    if rand(random_string.split.length) == index
      new_word = "##{generate_random_word}#"
      words_arr << word
      string_for_change << new_word << ' '
    else
      string_for_change << word << ' '
    end
    expected_string << word << ' '
  end
  [string_for_change.strip, words_arr, expected_string.strip]
end

class TestChangeString < Minitest::Unit::TestCase
  def test_1
    string_to_change, words_arr, expected_string = generate_array_and_str
    assert_equal(expected_string, ChangeString(string_to_change, words_arr))
  end
end


