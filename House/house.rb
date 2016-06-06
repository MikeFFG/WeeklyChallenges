class House

  def self.recite
    new.recite
  end

  def recite
    resulting_string = ""
    piece_array = pieces
    piece_array.reverse!
    piece_array.each do |index|
      resulting_array << piece_array
    end
    resulting_array
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end

puts House.recite


# start the first line with 'this is'.
# Start with the last piece, skip line
# start with the second to last piece, then the last piece
# etc.