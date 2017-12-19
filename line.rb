require 'cairo'
require './figure'

class Line < Figure

  attr_accessor :arg
  def initialize(window)
    super
    @size = window.width
    @x1 = window.width / 2 - @size / 2
    @y1 = window.height / 2
    @arg = 0
  end

  def draw(color = "red")
    @context.set_source_color(color)
    @context.move_to(@x1, @window.height - @y1)
    @context.line_to(x2, @window.height - y2)
    @context.stroke
  end

  def scale(s)
    @size = @size * s
  end

  def rotate(darg)
    x = @x1
    y = @y1
    @x1 = x * Math.cos(darg) - y * Math.sin(darg)
    @y1 = x * Math.sin(darg) + y * Math.cos(darg)
  end

  private

  def x2
    @x1 + @size * Math.cos(@arg)
  end

  def y2
    @y1 + @size * Math.sin(@arg)
  end
end