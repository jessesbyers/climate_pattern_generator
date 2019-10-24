class Weather
  attr_accessor :date, :url, :max_temp, :min_temp, :mean_temp, :precipitation, :next_day_url, :color, :location_name, :weather_station
  @@all = []
  @@preview_all = []

  def self.year
    Scraper.clear
    @@all.clear
    if Date.leap?(CLI.search_terms[0].year.to_i)
      # 366.times do
      13.times do
        @@all << Scraper.new
        # sleep 4
      end
    else
      # 365.times do
      12.times do
        @@all << Scraper.new
        # sleep 4
      end
    end
  end

  def self.preview
    Scraper.clear
    @@preview_all.clear
    5.times do
      @@preview_all << Scraper.new
      end
  end

  def self.all
    @@all
  end

  def self.preview_all
    @@preview_all
  end
end
