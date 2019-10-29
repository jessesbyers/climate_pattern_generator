class ClimatePatternGenerator::Weather
  attr_accessor :date, :max_temp, :min_temp, :mean_temp, :color, :location_name, :weather_station, :temp_units, :precipitation
  @@preview_all = []
  @@all = []

  def self.year
    ClimatePatternGenerator::Scraper.clear
    @@all.clear
    if Date.leap?(ClimatePatternGenerator::CLI.search_terms[0].year.to_i)
      # 366.times do #for full year
      13.times do #for demo
        @@all << ClimatePatternGenerator::Scraper.new
        # sleep 4 #for full year
      end
    else
      # 365.times do #for full year
      12.times do #for demo
        @@all << ClimatePatternGenerator::Scraper.new
        # sleep 4 #for full year
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
