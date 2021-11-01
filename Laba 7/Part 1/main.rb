def file_processing(file_f, file_h)
  f = File.new(file_f, 'r')
  h = File.new(file_h, 'w')
  f.readlines.each do |line|
    h.write(line.scan(/[Aa]+./).each { |x| x.delete!('aA') }.join.concat("\n"))
  end
  f.close
  h.close
end

def file_create(file_f)
  File.open(file_f, 'w') do |file|
    str = (0..20 + rand(10)).map { rand(65..85).chr }.join.downcase!
    str.insert(rand(str.length - 1), 'a') unless str.include?('a')
    file.write(str)
  end
end
