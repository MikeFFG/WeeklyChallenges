class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(array)
    results = []
    array.select do |possible_anagram|
      next if possible_anagram.downcase == @word
      if possible_anagram.downcase.split(//).sort == @word.split(//).sort
        results << possible_anagram
      end
    end
    results
  end


end