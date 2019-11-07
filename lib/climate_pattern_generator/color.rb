class ClimatePatternGenerator::Color
  attr_accessor :color, :min, :max
  attr_reader :id
  @@all = []

  def initialize(color, min, max, id=nil)
    @color = color
    @min = min
    @max = max
    @id = id
    @@all << self
  end

  def self.all
    @@all
  end
end
