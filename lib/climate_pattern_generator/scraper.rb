require 'open-uri'
require 'nokogiri'
require 'pry'


class ClimatePatternGenerator::Dataset
  attr_accessor :date, :temperature, :color, :url

  def self.print
    self.scrape_data
  end

  def self.scrape_data
    # need to set an empty array that will be filled with scraped data
    # daily_data = []
    # this data will be replaced by scraped data
    day1 = self.new
    day1.date = "fake date"
    day1.temperature = "fake temperature"
    day1.color = "fake color"
    day1.url = "fake url"

    day2 = self.new
    day2.date = "fake date"
    day2.temperature = "fake temperature"
    day2.color = "fake color"
    day2.url = "fake url"

    daily_data = [day1, day2]
    # ##end of data that will be replaced

##############beginning of scraping code from weather underground#########
    location = "us/vt/st.-albans"
    year = "2019"
    month = "8"

    html = open("https://www.wunderground.com/history/monthly/#{location}/KPBG/date/#{year}-#{month}")
    doc = Nokogiri::HTML(html)

    # daily_data << shovel scraped data into array

    # need to return daily_data array
    daily_data
  end
end
