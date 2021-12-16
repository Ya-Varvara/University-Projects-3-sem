class ArmstController < ApplicationController
  def input; end

  def view
    begin
      @received = params[:v1].to_i
    rescue StandardError
      @result = 'Введенная длина числа некорректна!'
      @numbers = 'Incorrect!'
    end

    begin
      if @received < 1 && @received > 9
        @result = 'Введенная длина числа некорректна!'
        @numbers = []
      else
        num = Armst.find_by!(number: @received)
        @result = "Числа Армстронга длиной #{@received}"
        @numbers = ActiveSupport::JSON.decode(num.decomp)
      end
    rescue ActiveRecord::RecordNotFound
      @result = "Числа Армстронга длиной #{@received}"
      @numbers = find_numbers(@received)
      Armst.create(number: @received, decomp: ActiveSupport::JSON.encode(@numbers))
    end
  end

  def results
    result = Armst.all.map { |el| { number: el.number, decomp: ActiveSupport::JSON.decode(el.decomp) } }

    respond_to do |format|
      format.xml { render xml: result.to_xml }
    end
  end

  def num_degree(len)
    (0..9).map { |x| x**len }
  end

  def armstr(x, deg)
    x.digits(10).inject(0) { |sum, n| sum + deg[n.to_i] } == x
  end

  def find_numbers(length)
    deg = num_degree(length)
    numbers = []
    (10**(length - 1)..(10**length)).each do |x|
      numbers.push([x, x.to_s.split('').map { |n| "#{n}^#{length}" }.join("\s+\s")]) if armstr(x, deg)
    end
    numbers
  end

end
