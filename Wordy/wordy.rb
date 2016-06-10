# frozen_string_literal: true

class WordProblem
  def initialize(word_problem)
    @word_problem = word_problem
  end

  def translate(word)
    return word.to_i if word.to_i != 0
    case word
    when 'plus' then '+'
    when 'minus' then '-'
    when '0' then 0
    when 'multiplied' then '*'
    when 'divided' then '/'
    else
      raise ArgumentError
    end
  end

  def simplify!
    @word_problem = @word_problem.split
    @word_problem.delete('by')

    if @word_problem[0] != 'What' then raise ArgumentError
    elsif @word_problem.size.even? then raise ArgumentError
    end

    @word_problem.slice!(0..1)
    final_word_stripped = @word_problem.last.downcase.gsub!(/[?]/, ' ').rstrip!
    @word_problem[@word_problem.size - 1] = final_word_stripped
  end

  def answer
    simplify!
    translated_array = @word_problem.map { |word| translate(word) }

    if translated_array.size == 3
      translated_array[0].send(translated_array[1], translated_array[2])
    elsif translated_array.size == 5
      part1 = translated_array[0].send(translated_array[1], translated_array[2])
      part1.send(translated_array[3], translated_array[4])
    end
  end
end
