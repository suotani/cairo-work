require 'cairo'
require './fractal'
require './line'

class Koch < Fractal
  VECTOR = [
    [       0,                   0,                   0],
    [       1,                   0,     Math::PI / 3.00],
    [3 / 2.00, Math.sqrt(3) / 2.00, Math::PI * 5 / 3.00],
    [       2,                   0,                   0]
  ]
  SCALE = 3.00

  FILE_NAME = "Koch/koch"

  def initialize(window)
    super()
    @collection << [Line.new(window)]
  end

  private

  def copy
    array = []
    @collection[0].each do |c|
      part = [c]
      (self.class::VECTOR.size - 1).times do
        part << c.dup
      end
      array << part
    end
    @collection = array
  end

  def move
    @collection.each do |part|
      ox = part.first.x1
      oy = part.first.y1
      part.each_with_index do |p, i|
        p.x1 = self.class::VECTOR[i][0] * p.size / SCALE
        p.y1 = self.class::VECTOR[i][1] * p.size / SCALE
        p.rotate(p.arg)
        p.x1 += ox
        p.y1 += oy
        p.arg += self.class::VECTOR[i][2]
      end
    end
  end
end

class Koch2 < Koch
  VECTOR = [
    [       0, 0,                0],
    [       1, 0,  Math::PI / 2.00],
    [       1, 1,                0],
    [       2, 1, -Math::PI / 2.00],
    [       2, 0,                0]
  ]
  FILE_NAME = "Koch2/koch2"
end

class Koch3 < Koch
  VECTOR = [
    [       0, 0,                0],
    [       1, 0,  Math::PI / 3.00],
    [3 / 2.00, 0, -Math::PI / 3.00],
    [       2, 0,                0]
  ]
  FILE_NAME = "Koch3/koch3"
end