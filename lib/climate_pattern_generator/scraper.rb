require 'open-uri'
require 'nokogiri'
require 'pry'


class ClimatePatternGenerator::Dataset
  attr_accessor :date, :temperature, :color, :url

  def self.print
    # coded with fake data to start, will replace later
    date = "fake date"
    temperature = "fake temperature"
    color = "fake color"
    url = "fake url"
    puts "Complete?   Date      Temperature      Color       URL"
    puts "_________   #{date}   #{temperature}   #{color}    #{url}"
    puts "_________   #{date}   #{temperature}   #{color}    #{url}"

    day1 = self.new
    day1.date = "fake date"
    day1.temperature = "fake temperature"
    day1.color = "fake color"
    day1.url = "fake url"

    # [day1, day2, day3..day365]

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
