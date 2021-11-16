require 'minitest/autorun'
require './main'

# Presteps
def generate_files(file_f)
  str_f = (0..3 + rand(20..30)).map { rand(65..85).chr }
  str_f.insert(rand(str_f.length - 1), 'A') unless str_f.include?('A')
  File.open(file_f, 'w') { |file| file.write(str_f.join.downcase) }
  (1..str_f.length - 1).map { |i| str_f[i] if str_f[i - 1] == 'A' }.join.downcase
end

# Test
class TestFileProcessing < Minitest::Unit::TestCase
  def test_first
    str_exp_file_h = generate_files('F.txt')
    str_file_h = ''
    file_processing('F.txt', 'H.txt')
    File.open('H.txt', 'r') { |file| str_file_h = file.read.chomp }
    assert_equal(str_exp_file_h, str_file_h)
  end
end
