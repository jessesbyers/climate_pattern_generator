class ClimatePatternGenerator::Weather
  attr_accessor :date, :max_temp, :min_temp, :mean_temp, :color, :location_name, :weather_station, :temp_units, :precipitation
  @@preview_all = []
  @@all = []

  def self.year
    ClimatePatternGenerator::Scraper.clear
    @@all.clear
    if Date.leap?(ClimatePatternGenerator::CLI.year.to_i)
      366.times do
        @@all << ClimatePatternGenerator::Scraper.new
        sleep 4
      end
    else
      365.times do
        @@all << ClimatePatternGenerator::Scraper.new
        sleep 4
      end
    end
  end

  def self.preview
    ClimatePatternGenerator::Scraper.clear
    @@preview_all.clear
    5.times do
      @@preview_all << ClimatePatternGenerator::Scraper.new
    end
  end

  def self.all
    @@all
  end

  def self.preview_all
    @@preview_all
  end
end
