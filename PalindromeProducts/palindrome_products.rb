class Palindromes

  def initialize(args)
    @max = args[:max_factor]
    @min = args[:min_factor] || 1
    @largest = Single_Palindrome.new(-1, [])
    @smallest = Single_Palindrome.new(-1, []) 
  end

  def generate
    (@min..@max-1).each do |outer_num|
      (@min..@max).each do |inner_num|
        multiplication = outer_num * inner_num
        if multiplication.to_s == multiplication.to_s.reverse
          if multiplication < @smallest.value || @smallest.value == -1
            @smallest.value = multiplication
            @smallest.factors = [[outer_num, inner_num]]
          elsif multiplication == @smallest.value
            @smallest.factors += [[outer_num, inner_num]]
          elsif multiplication > @largest.value || @largest.value == -1
            @largest.value = multiplication
            @largest.factors = [[outer_num, inner_num]]
          elsif multiplication == @largest.value
            @largest.factors += [[outer_num, inner_num]]
          end
        end
      end
    end
  end

  def largest
    @largest
  end

  def smallest
    @smallest
  end
end

class Single_Palindrome
  attr_accessor :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end
