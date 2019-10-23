# preview and year methods work.
# need to add print methods

class Weather
  attr_accessor :date, :url, :max_temp, :min_temp, :mean_temp, :precipitation, :next_day_url, :color, :location_name, :weather_station
  @@all = []
  @@preview_all = []

  def self.year
    Scraper.clear
    @@all.clear
    # if Date.leap?(self.year.to_i)
    if Date.leap?(CLI.search_terms[1].to_i)
      7.times do    #366
        @@all << Scraper.new
        # sleep 4
      end
    else
      6.times do    #365
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

  # def self.clear
  #   @@all.clear
  # end
  #
  # def self.preview_clear
  #   @@preview_all.clear
  # end
end


    # def initialize(data_attributes)
    #   zip = CLI.search_terms[0]
    #   year = CLI.search_terms[1]
    #   day = Scraper.new("https://www.almanac.com/weather/history/zipcode/#{zip}/#{year}-01-01")
    #   sleep 4
    #   @date = date
    #   @url = url
    #   @max_temp = max_temp
    #   @min_temp = min_temp
    #   @mean_temp = mean_temp
    #   @precipitation = precipitation
    #   @next_day_url = next_day_url
    #   @color = color
    #   @location_name = location_name
    #   @weather_station = weather_station
    #   @@year_data << day
    # end

#     def data_attributes
#       Scraper.all
#     end
#
#     def self.first_day
#       puts "Here is your daily maximum temperature data for zip code #{CLI.search_terms[0]}, year #{CLI.search_terms[1]}."
#       puts "Complete?  Date         Temperature     Yarn Color"
#       Scraper.all.each do |attr|
#         if Scraper.all == nil
#           puts "Please try again. Enter a valid zip code and any year between 1945 and the current year."
#           get_search_terms
#         else
#           puts "________   #{self.date}   #{self.max_temp} deg. F       #{self.color}"
#         end
#       end
#     end
#
#     def self.nextday
#       url = self.all[-1].next_day_url
#       Scraper.new(url)
#       sleep 4
#       self.new(data_attributes)
#     end
#
#     def self.list_nextday
#       day = self.all.last
#       puts "________   #{day.date}   #{day.max_temp.to_i} deg. F       #{day.color}"
#     end
#

#

# end
