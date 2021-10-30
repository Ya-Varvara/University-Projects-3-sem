# frozen_string_literal: true

# вычисляем значение y
def calculate(x, z)
  if x != 5
    (Math.sin(35.5 * (z.to_f / (x.to_f - 5))) + (x.to_f**2) / (2 * Math.exp(x.to_f))).round(3)
  else
    false
  end
end
