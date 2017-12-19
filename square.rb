require 'cairo'
require './figure'
class Square < Figure
  def initialize(window)
    super(window)
    @size = window.width
    @x1 = 0
    @y1 = 0
  end

  def draw(color = "red")
    @context.set_source_color(color) # 赤
    @context.rectangle(@x1, @y1, @size, @size)
    @context.fill
  end

  def scale(s)
    @size = @size * s
  end
end