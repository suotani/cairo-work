class Fractal

  attr_accessor :collection
  VECTOR = []
  SCALE = 1.00

  def initialize
    @collection = []
  end

  def create(n)
    n.times do
      copy
      move
      bond
      scale
    end
    draw_all
  end

  private

  def copy
    (self.class::VECTOR.size - 1).times do
      array = []
      @collection.first.each { |c| array << c.dup }
      @collection << array
    end
  end

  def move
    @collection.each_with_index do |part, i|
      part.each do |p|
        p.x1 += p.size / self.class::SCALE * self.class::VECTOR[i][0]
        p.y1 += p.size / self.class::SCALE * self.class::VECTOR[i][1]
      end
    end
  end

  def bond
    @collection = [@collection.flatten]
  end

  def scale
    @collection[0].each { |c| c.scale(1 / self.class::SCALE) }
  end

  def draw_all
    @collection[0].each { |c| c.draw }
  end
end