# Функция, считающая площадь фигуры
def intprg(a, b, &_block)
  sum = 0.0
  n = 100
  step = ((b.to_f - a.to_f) / n).round(5)
  a += step / 2
  n.times do
    sum += yield(a)
    a += step
  end
  (step * sum).round(5)
end
