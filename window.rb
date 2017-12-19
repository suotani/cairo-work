require 'cairo'
class Window
  attr_accessor :height, :width, :context, :surface, :format

  def initialize(w, h)
    @format = Cairo::FORMAT_ARGB32
    @surface = Cairo::ImageSurface.new(@format, w, h)
    @context = Cairo::Context.new(@surface)
    @height = h; @width = w;
  end

  def draw
    @context.set_source_rgb(1, 1, 1) # 白
    @context.rectangle(0, 0, @width, @height)
    @context.fill
  end

  def file_output(n)
    @surface.write_to_png("#{n}.png")
    p "complete output to file: #{n}.png!"
  end
end