# frozen_string_literal: true

class ArmstrongsNumbersController < ApplicationController
  def input; end

  def view
    begin
      @received = Integer(params[:v1])
      if @received >= 1 && @received <= 9
        @numbers = find_numbers(@received.to_i)
        @result = "Числа Армстронга длиной #{@received}"
      else
        @result = 'Некорректный ввод!'
        @numbers = []
      end
    rescue StandardError
      @result = 'Некорректный ввод!'
      @numbers = []
    end

    respond_to do |format|
      format.html
      format.xml {render xml: {result: @result, numbers: @numbers}}
    end
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
