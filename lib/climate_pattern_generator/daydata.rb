class Day_data
  attr_accessor :date, :url, :max_temp, :min_temp, :mean_temp, :precipitation, :next_day_url, :color, :location_name, :weather_station
  attr_reader :data_attributes
  @@year_data = []

  end

# does not recognize attributes - need to revise
    # def initialize(attributes)
    #   attributes.each {|key, value| self.send(("#{key}="), value)}
    # end

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
#     def self.all
#       @@year_data
#     end
#
#     def self.clear
#       @@year_data.clear
#     end
# end
