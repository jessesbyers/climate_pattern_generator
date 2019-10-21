class Data
    attr_accessor :date, :url, :max_temp, :min_temp, :mean_temp, :precipitation, :next_day_url, :color, :location_name, :weather_station
    @@year_data = []

    def initialize (data_attributes)
      Scraper.data_attributes.each {|key, value| self.send(("#{key}="), value)}
      @@year_data << self
    end

    def self.all
      @@year_data
    end

    def first_day
      url = "https://www.almanac.com/weather/history/zipcode/#{self.zip}/#{self.year}-01-01"
      Scraper.new(url)
      sleep 4
      list_day
    end

    def list_day
      puts "Here is your daily maximum temperature data for zip code #{self.zip}, year #{self.year}."
      puts "Complete?  Date         Temperature     Yarn Color"
      Data.all.each.with_index(1) do |day, i|
        if Data.all == nil
          puts "Please try again. Enter a valid zip code and any year between 1945 and the current year."
          get_search_terms
        else
          puts "________   #{day.date}   #{day.max_temp.to_i} deg. F       #{day.color}"
        end
      end
    end

    def list_next_day
      day = Data.all.last
      puts "________   #{day.date}   #{day.max_temp.to_i} deg. F       #{day.color}"
    end
end

# data_attributes = {
#   date: Scraper.day.date,
#   url: Scraper.day.url,
#   max_temp: Scraper.day.max_temp,
#   min_temp: Scraper.day.min_temp,
#   mean_temp: Scraper.day.mean_temp,
#   precipitation: Scraper.day.precipitation,
#   next_day_url: Scraper.day.next_day_url,
#   color: Scraper.day.color,
#   location_name: Scraper.day.location_name,
#   weather_station: Scraper.day.weather_station
# }
