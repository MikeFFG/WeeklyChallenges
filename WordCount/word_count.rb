# frozen_string_literal: true

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def remove_quotation_marks_but_leave_apostrophe(array)
    array.map! do |word|
      word.strip!
      word.slice!(0) if word.start_with?("'")
      word.slice!(word.length - 1)  if word.end_with?("'")
      word
    end
  end

  def strip_phrase
    stripped_array = @phrase.gsub(/[^\sa-zA-Z0-9,']/, '')
    stripped_array = stripped_array.gsub(/[,]/, ' ').downcase.split
    remove_quotation_marks_but_leave_apostrophe(stripped_array)
  end

  def word_count
    count_hash = {}
    strip_phrase.each do |word|
      if count_hash.key?(word)
        count_hash[word] += 1
      else
        count_hash[word] = 1
      end
    end

    count_hash
  end
end
