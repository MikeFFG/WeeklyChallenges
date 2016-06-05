require 'pry'

class WordProblem
  def initialize(word_problem)
    @word_problem = word_problem
  end

  def translate(word)
    if word.to_i != 0
      return word.to_i
    end
    new_word = case word
               when 'plus'
                 '+'
               when 'minus'
                 '-'
               when '0'
                 0
               when 'multiplied'
                 '*'
               when 'divided'
                 '/'
               else
                 raise ArgumentError
               end
    new_word
  end

  def simplify!(word_array)
    word_array.delete_at(0)
    word_array.delete_at(0)
    word_array[word_array.size - 1] = word_array.last.downcase.gsub!(/[?]/, ' ').rstrip
    word_array
  end

  def answer
    word_array = @word_problem.split
    word_array.delete('by')
    if word_array[0] != 'What'
      raise ArgumentError
    elsif !word_array.size.odd?
      raise ArgumentError
    end
    simplify!(word_array)
    answer = 0
    if word_array.size == 3
      answer = translate(word_array[0]).send(translate(word_array[1]), translate(word_array[2]))
    elsif word_array.size == 5
      answer1 = translate(word_array[0]).send(translate(word_array[1]), translate(word_array[2]))
      answer = answer1.send(translate(word_array[3]), translate(word_array[4]))
    end
  end

end

wordproblem = WordProblem.new('What is 1 plus 1 plus 1?')

p wordproblem.answer