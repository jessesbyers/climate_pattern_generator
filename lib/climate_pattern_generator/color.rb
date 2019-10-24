class ClimatePatternGenerator::Color
  attr_accessor :color, :min, :max
  attr_reader :colors
  @@all = []

  def initialize(color, min, max)
    @color = color
    @min = min
    @max = max
    @@all << self
  end

  def self.all
    @@all
  end
end
