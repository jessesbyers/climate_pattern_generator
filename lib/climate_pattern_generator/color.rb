class Color

  # @@color_chart = [
  #     ["Currant", 121, 1000],
  #     ["Garnet", 116, 120],
  #     ["Rooibos", 111, 115],
  #     ["Hollyberry", 106, 110],
  #     ["Firecracker", 101, 105],
  #     ["Cranberry", 96, 100],
  #     ["Red", 91, 95],
  #     ["Victorian", 86, 90],
  #     ["Papaya", 81, 85],
  #     ["Orange", 76, 80],
  #     ["Conch", 71, 75],
  #     ["Caution", 66, 70],
  #     ["Semolina", 61, 65],
  #     ["Creme Brulee", 56, 60],
  #     ["Green Tea", 51, 55],
  #     ["Peapod", 46, 50],
  #     ["Grass", 41, 45],
  #     ["Everglade", 36, 40],
  #     ["Tranquil", 31, 35],
  #     ["Calypso", 26, 30],
  #     ["Whirlpool", 21, 25],
  #     ["Baltic", 16, 20],
  #     ["Fjord", 11, 15],
  #     ["Ciel", 6, 10],
  #     ["Celestial", 1, 5],
  #     ["Sapphire", -4, 0],
  #     ["Solstice", -9, -5],
  #     ["Lullaby", -14, -10],
  #     ["Amethyst", -19, -15],
  #     ["Indigo", -24, -20],
  #     ["Blackberry", -29, -25],
  #     ["Coal", -1000, -30]
  #   ]
  #
  # def self.get_color
  #   color = ""
  #       @@color_chart.map do |color_row|
  #           #  if ClimatePatternGenerator::Data.day.temperature.to_i >= color_row[1] && ClimatePatternGenerator::Data.day.temperature.to_i <= color_row[2]
  #            if Date.all[-1].max_temp.to_i >= color_row[1] && Date.day[-1].max_temp.to_i <= color_row[2]
  #           # if @temperature.to_i >= color_row[1] && @temperature.to_i <= color_row[2]
  #             @color = "#{color_row[0]}"
  #           end
  #         end
  #    @color
  #  end

end
