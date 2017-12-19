require 'cairo'
require './fractal'
require './triangle'

class Gasket < Fractal

  arg = Math::PI / 6
  VECTOR = [
    [0, 0], [- Math.sin(arg), Math.cos(arg)], [Math.sin(arg), Math.cos(arg)]
  ]

  SCALE = 2.00
  FILE_NAME = "Gasket/gasket"

  def initialize(window)
    super()
    @collection << [Triangle.new(window)]
  end
end