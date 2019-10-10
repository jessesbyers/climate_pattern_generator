require 'open-uri'
require 'nokogiri'
require 'pry'


class ClimatePatternGenerator::Dataset
  attr_accessor :date, :temperature, :color, :url

  def self.print

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

    [day1, day2]

  end

  def get_temperature_data
    location = "us/vt/st.-albans"
    year = "2019"
    month = "8"

    html = open("https://www.wunderground.com/history/monthly/#{location}/KPBG/date/#{year}-#{month}")
    doc = Nokogiri::HTML(html)
    data_hash = {}




  end
end
