# фукнция, вычисляющая k-й член ряда
def member_of_row(k)
  1.0 / (k * (k + 1))
end

# фукнция, вычисляющая сумму ряда
def sum_of_row(eps)
  k = 1
  count = 0
  members = Enumerator.new do |row|
    loop do
      row << member_of_row(k)
      count += 1
      k += 1
    end
  end
  sum = members.take_while { member_of_row(k) > eps }.sum.round(5)
  puts "Количество итераций: #{count}"
  sum
end
