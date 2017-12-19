require 'cairo'
require './figure'
class Triangle < Figure

  def initialize(window)
  	super
  	@size = window.width
    @x1 = window.width / 2
    @y1 = window.height - @size * Math.cos(Math::PI / 6) - 10
  end

  def draw(color = "red")
    @context.set_source_color(color)
    @context.triangle(@x1, @y1, x2, y2, x3, y3)
    @context.fill
  end

  def scale(s)
    @size = @size * s
  end

  private

  def x2
    @x1 - @size / 2
  end

  def y2
    @y1 + @size * Math.cos(Math::PI / 6)
  end

  def x3
    @x1 + @size / 2
  end

  def y3
    y2
  end
end