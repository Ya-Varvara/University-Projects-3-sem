def num_degree(len)
  (0..9).map { |x| x**len }
end

def is_armstrong(x, deg)
  x.digits(10).inject(0) { |sum, n| sum + deg[n.to_i] } == x
end

def find_numbers(length)
  deg = num_degree(length)
  numbers = []
  (10**(length - 1)..(10**length)).each do |x|
    numbers.push([x, x.to_s.split('').map { |n| "#{n}^^#{length}" }.join("\s+\s")]) if is_armstrong(x, deg)
  end
  numbers
end

p find_numbers(3)
