# фукнция, вычисляющая k-й член ряда
def member_of_row(k)
  1.0 / (k * (k + 1))
end

# фукнция, вычисляющая сумму ряда
def sum_of_row(eps)
  k = 1
  count = 0
  sum = 0.0
  while member_of_row(k) > eps
    sum += member_of_row(k)
    k += 1
    count += 1
  end
  puts "Количество итераций: #{count}"
  sum.round(5)
end
