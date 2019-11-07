class ClimatePatternGenerator::Color
  attr_accessor :color, :min, :max
  @@all = []

  def initialize(color, min, max)
    @color = color
    @min = min
    @max = max
    # @@all << self
  end

  def self.new_from_db(row)
    new_color = self.new
    new_color.id = row[0]
    new_color.color = row[1]
    new_color.min = row[2]
    new_color.max = row[3]
    new_color
  end

  def self.all
    @@all
  end
end
