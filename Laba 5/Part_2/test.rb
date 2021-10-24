require 'minitest/autorun'
require './main'

GENERATED_WORD_LEN = 0..5 + rand(10)
GENERATED_STRING_LEN = 0..3 + rand(5)

def generate_random_word
  (GENERATED_WORD_LEN).map { (65 + rand(26)).chr }.join
end

def generate_random_string
  (GENERATED_STRING_LEN).map { generate_random_word }.join(" ");
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


