require 'pry'

class PhoneNumber
  def initialize(phone_number)
    @phone_number = phone_number
  end

  def number
    @phone_number.gsub!(/[^0-9a-zA-Z]/, '')
    @phone_number = @phone_number.to_i.to_s

    if @phone_number.size == 11 && @phone_number.start_with?('1')
      @phone_number = @phone_number.slice(1..10)
    end
    if @phone_number.size != 10
      @phone_number = '0000000000'
    end

    @phone_number.to_s
  end

  def area_code
    number.slice(0..2)
  end

  def to_s
    full_number = '(' + area_code + ')' + 
                  ' ' + number.slice(3..5) + 
                  '-' + number.slice(6..9)
  end
end