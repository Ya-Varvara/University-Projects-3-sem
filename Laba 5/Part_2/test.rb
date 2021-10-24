require 'minitest/autorun'
require './main'

def Generate_random_string(len)
  (0..3 + rand(len)).map {(0..5 + rand(10)).map { (65 + rand(26)).chr }.join}.join(" ");
end

def Generate_array_and_str(orig_s, change_s, arr)
  change_s.split.each_with_index do |word, index|
    if rand(change_s.split.length) == index
      new_word = "#" + (0..3 + rand(5)).map{(65 + rand(26)).chr}.join + "#"
      arr << word
      orig_s << new_word
    else
      orig_s << word
    end
  end
end

class TestChangeString < Minitest::Unit::TestCase
  def test_1
    orig_str = []
    change_str = Generate_random_string(5)
    arr_w = []
    Generate_array_and_str(orig_str, change_str, arr_w)
    assert_equal(change_str, ChangeString(orig_str.join(' '), arr_w))
  end
end


