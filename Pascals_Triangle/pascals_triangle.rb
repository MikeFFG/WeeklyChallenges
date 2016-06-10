require 'pry'
class Triangle
  def initialize(num_rows)
    @num_rows = num_rows
  end

  def rows
    triangle = []

    @num_rows.times do |index|
      row = []
      items_in_this_row = index + 1
      items_in_this_row.times do |item|
        if item == 0 || item == items_in_this_row - 1
          row << 1
        else
          value = triangle[index - 1][item - 1] + triangle[index - 1][item]
          row << value
        end
      end
      triangle << row
    end
    triangle
  end
end

triangle = Triangle.new(4)

p triangle.rows