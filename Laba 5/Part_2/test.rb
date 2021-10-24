require 'minitest/autorun'
require './main'

def Generate_Str(orig_str, ch_str, arr_w)
  ch_str = (0..2 + rand(5)).map { (0..5 + rand(10)).map { (65 + rand(26)).chr }.join }
  ch_str.each_with_index do |word, index|
    if index == rand(ch_str.size)
      new_word = "#" + (0..3 + rand(5)).map{(65 + rand(26)).chr}.join + "#"
      arr_w << word
      orig_str << new_word
    else
      orig_str << word
    end
  end
  ch_str.join(' ')
  orig_str.join(' ')
end

class TestChangeString < Minitest::Unit::TestCase
  def test_1
    orig_str = ""
    change_str = ""
    arr_w = []
    Generate_Str(orig_str, change_str, arr_w)
    assert_equal(change_str, ChangeString(orig_str, arr_w))
  end
end