# вычисляем значение y

def calculate(x, z)
    x.to_f
    z.to_f
    if x != 5 
        return (Math.sin(35.5*(z/(x-5)))+(x**2)/(2*Math.exp(x))).round(3)
    else 
        return false
    end
    end
    

