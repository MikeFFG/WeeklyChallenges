# frozen_string_literal: true

class Triangle
  def initialize(num_rows)
    @num_rows = num_rows
  end

  def rows
    triangle = []

    @num_rows.times do |index|
      row = []

      (index + 1).times do |item|
        row << 1 && next if item == 0 || item == index
        value = triangle[index - 1][item - 1] + triangle[index - 1][item]
        row << value
      end

      triangle << row
    end

    triangle
  end
end
