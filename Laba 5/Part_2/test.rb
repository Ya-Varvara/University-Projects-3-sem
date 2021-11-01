# frozen_string_literal: true

require 'minitest/autorun'
require './main'

def generate_random_string(len)
  (0..(3 + rand(len))).map { (0..rand(5..14)).map { rand(65..90).chr }.join }.join(' ')
end

def generate_array_and_str(orig_s, change_s, arr)
  change_s.split.each_with_index do |word, index|
    if rand(change_s.split.length) == index
      new_word = "\##{(0..rand(3..7)).map { rand(65..90).chr }.join}\#"
      arr << word
      orig_s << new_word
    else
      orig_s << word
    end
  end
end

# Ruby Documentation
class TestChangeString < Minitest::Unit::TestCase
  def test_first
    orig_str = []
    change_str = generate_random_string(5)
    arr_w = []
    generate_array_and_str(orig_str, change_str, arr_w)
    assert_equal(change_str, ChangeString(orig_str.join(' '), arr_w))
  end
end
