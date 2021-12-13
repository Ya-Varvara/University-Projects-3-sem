# frozen_string_literal: true

class ArmstrongsNumbersController < ApplicationController
  def index
    begin
      @value = Integer(params[:v1])
      if @value >= 1 && @value <= 9
        @numbers = find_numbers(@value.to_i)
        @result = "Числа Армстронга длиной #{@value}"
      else
        @result = 'Некорректный ввод!'
        @numbers = []
      end
    rescue StandardError
      @result = 'Некорректный ввод!'
      @numbers = []
    end
    respond_to do |format|
      format.rss { render xml: { result: @result, numbers: @numbers } }
      format.xml { render xml: { result: @result, numbers: @numbers } }
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
