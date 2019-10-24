# not working at all, not connected to rest of code - initialize creates 32 objects of the same color

class Color
  attr_accessor :color, :min, :max
  attr_reader :colors
  @@all = []

# need to fix - outputs 32 objects of same color
  def initialize
    colors = [
      {:color => "Currant", :min => 121, :max => 1000},
      {:color => "Garnet", :min => 116, :max => 120},
      {:color => "Rooibos", :min => 111, :max => 115},
      {:color => "Hollyberry", :min => 106, :max => 110},
      {:color => "Firecracker", :min => 101, :max => 105},
      {:color => "Cranberry", :min => 96, :max => 100},
      {:color => "Red", :min => 91, :max => 95},
      {:color => "Victorian", :min => 86, :max => 90},
      {:color => "Papaya", :min => 81, :max => 85},
      {:color => "Orange", :min => 76, :max => 80},
      {:color => "Conch", :min => 71, :max => 75},
      {:color => "Caution", :min => 66, :max => 70},
      {:color => "Semolina", :min => 61, :max => 65},
      {:color => "Creme Brulee", :min => 56, :max => 60},
      {:color => "Green Tea", :min => 51, :max => 55},
      {:color => "Peapod", :min => 46, :max => 50},
      {:color => "Grass", :min => 41, :max => 45},
      {:color => "Everglade", :min => 36, :max => 40},
      {:color => "Tranquil", :min => 31, :max => 35},
      {:color => "Calypso", :min => 26, :max => 30},
      {:color => "Whirlpool", :min => 21, :max => 25},
      {:color => "Baltic", :min => 16, :max => 20},
      {:color => "Fjord", :min => 11, :max => 15},
      {:color => "Ciel", :min => 6, :max => 10},
      {:color => "Celestial", :min => 1, :max => 5},
      {:color => "Sapphire", :min => -4, :max => 0},
      {:color => "Solstice", :min => -9, :max => -5},
      {:color => "Lullaby", :min => -14, :max => -10},
      {:color => "Amethyst", :min => -19, :max => -15},
      {:color => "Indigo", :min => -24, :max => -20},
      {:color => "Blackberry", :min => -29, :max => -25},
      {:color => "Coal", :min => -1000, :max => -30}
    ]
    @@all.clear
    colors.each do |row|
      row.each do |key, value|
        self.send(("#{key}="), value)
        @@all << self
      end
      binding.pry
    end
  end

  def self.all
    @@all
  end

  # def self.clear
  #   @@all.clear
  # end
end

# def initialize(color)
#     color.each do |key, value|
#       self.send(("#{key}="), value)
#       @@all << self
#       end
#     end
#   end
#
# def create_from_hash
#   colors = [
#     {:color => "Currant", :min => 121, :max => 1000},
#     {:color => "Garnet", :min => 116, :max => 120},
#     {:color => "Rooibos", :min => 111, :max => 115},
#     {:color => "Hollyberry", :min => 106, :max => 110},
#     {:color => "Firecracker", :min => 101, :max => 105},
#     {:color => "Cranberry", :min => 96, :max => 100},
#     {:color => "Red", :min => 91, :max => 95},
#     {:color => "Victorian", :min => 86, :max => 90},
#     {:color => "Papaya", :min => 81, :max => 85},
#     {:color => "Orange", :min => 76, :max => 80},
#     {:color => "Conch", :min => 71, :max => 75},
#     {:color => "Caution", :min => 66, :max => 70},
#     {:color => "Semolina", :min => 61, :max => 65},
#     {:color => "Creme Brulee", :min => 56, :max => 60},
#     {:color => "Green Tea", :min => 51, :max => 55},
#     {:color => "Peapod", :min => 46, :max => 50},
#     {:color => "Grass", :min => 41, :max => 45},
#     {:color => "Everglade", :min => 36, :max => 40},
#     {:color => "Tranquil", :min => 31, :max => 35},
#     {:color => "Calypso", :min => 26, :max => 30},
#     {:color => "Whirlpool", :min => 21, :max => 25},
#     {:color => "Baltic", :min => 16, :max => 20},
#     {:color => "Fjord", :min => 11, :max => 15},
#     {:color => "Ciel", :min => 6, :max => 10},
#     {:color => "Celestial", :min => 1, :max => 5},
#     {:color => "Sapphire", :min => -4, :max => 0},
#     {:color => "Solstice", :min => -9, :max => -5},
#     {:color => "Lullaby", :min => -14, :max => -10},
#     {:color => "Amethyst", :min => -19, :max => -15},
#     {:color => "Indigo", :min => -24, :max => -20},
#     {:color => "Blackberry", :min => -29, :max => -25},
#     {:color => "Coal", :min => -1000, :max => -30}
#   ]
#   colors.each do |color|
#     color.each(Color.new(color))
#   end
