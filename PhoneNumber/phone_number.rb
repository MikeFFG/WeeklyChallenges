# frozen_string_literal: true

class PhoneNumber
  def initialize(phone_number)
    @phone_number = phone_number
  end

  def clean_number
    @phone_number.gsub!(/[^0-9a-zA-Z]/, '')

    # This to pass test_invalid_when_10_digits_with_extra_letters
    @phone_number = @phone_number.to_i.to_s
  end

  def number
    clean_number
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
    '(' + area_code + ')' \
      ' ' + number.slice(3..5) +
      '-' + number.slice(6..9)
  end
end
