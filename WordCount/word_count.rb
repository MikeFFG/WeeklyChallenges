require 'pry'

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def strip_phrase
    stripped_array = @phrase.gsub(/[?.&@$%^&:!]/, '')
    stripped_array = stripped_array.gsub(/[\n]/, '')
    stripped_array = stripped_array.gsub(/[,]/, ' ').downcase.split
    stripped_array.map! do |word|
      word.strip!
      word.slice!(0) if word.start_with?("'")
      word.slice!(word.length-1)  if word.end_with?("'")
      word
    end
    stripped_array
  end

  def word_count
    count_hash = {}
    strip_phrase.each do |word|
      if count_hash.has_key?(word)
        count_hash[word] += 1
      else
        count_hash[word] = 1
      end
    end
    count_hash
  end

end

phrase = Phrase.new("Bob can't a live a 'long' a life.")
p phrase.word_count