require 'cairo'
require './fractal'
require './square'

class Carpet < Fractal

  VECTOR = [
    [0, 0], [1, 0], [0, 1], [0, 2], [2, 0], [2, 1], [1, 2], [2, 2]
  ]
  SCALE = 3.00

  FILE_NAME = "Carpet/carpet"

  def initialize(window)
    super()
    @collection << [Square.new(window)]
  end
end