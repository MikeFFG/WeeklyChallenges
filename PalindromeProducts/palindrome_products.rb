require 'pry'

module Limitable
  def min_factor
    @limits[:min_factor] || 1
  end

  def max_factor
    @limits[:max_factor]
  end
end

class Palindromes
  include Limitable

  attr_reader :values, :factors, :min_factor, :max_factor
  def initialize(factor_limits)
    @limits = factor_limits
    @values = []
    @factors = []
  end

  def generate
    min_factor = @limits[:min_factor].to_i
    max_factor = @limits[:max_factor].to_i
    (min_factor..max_factor).each do |first_factor|
      (min_factor..max_factor).each do |second_factor|
        possibility = first_factor * second_factor
        possibility_array = possibility.to_s.split(//).to_a
        if possibility_array == possibility_array.reverse
          @values << possibility
          @factors << [first_factor, second_factor]
        end
      end
    end
    @values.uniq!
  end

  def largest
    palindrome = Single_Palindrome.new(@values.sort.last, @factors)
  end

  def smallest
    palindrome = Single_Palindrome.new(@values.sort.first, @factors)
  end
end

class Single_Palindrome
  include Limitable
  attr_reader :value
  def initialize(value, factors)
    @value = value
    @factors = factors
  end

  def factors
    resultant_factors = []
    resultant_factors = @factors.select { |array| array[0] * array[1] == value }
    resultant_factors.uniq!
    resultant_factors
  end
end

palindromes = Palindromes.new(max_factor: 9, min_factor: 1)
palindromes.generate
largest = palindromes.largest
p largest.factors