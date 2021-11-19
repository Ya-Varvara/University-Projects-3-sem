# фукнция, вычисляющая k-й член ряда
def member_of_row(k)
  1.0 / (k * (k + 1))
end

# фукнция, вычисляющая сумму ряда
def sum_of_row(eps)
  members = Enumerator.new do |row|
    k = 1
    count = 0
    loop do
      row << member_of_row(k)
      count += 1
      k += 1
    end
  end
  arr = members.take_while { |x| x > eps }
  puts "Количество итераций: #{arr.length}"
  arr.sum.round(5)
end
