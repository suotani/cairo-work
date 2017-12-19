class Figure
  attr_accessor :x1, :y1, :size, :context, :window
  def initialize(window)
    @window = window
    @context = window.context
  end

  def draw
  end

  def scale
  end
end