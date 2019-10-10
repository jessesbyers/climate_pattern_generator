

class ClimatePatternGenerator::Dataset
  attr_accessor :date, :temperature, :color, :url

  def self.print
    self.scrape_data
  end

  def self.scrape_data
    daily_data = []
    daily_data << self.scrape_date_and_temp
    #     will also need to scrape color and url eventually
    # daily_data << self.color_chart_data
    daily_data
  end

  def self.scrape_date_and_temp
    # ### this data will be replaced once scraping works

    # day1 = self.new
    # day1.date = "fake date"
    # day1.temperature = "fake temperature"
    # day1.color = "fake color"
    # day1.url = "fake url"
    #
    # day2 = self.new
    # day2.date = "fake date"
    # day2.temperature = "fake temperature"
    # day2.color = "fake color"
    # day2.url = "fake url"
    #
    # daily_data = [day1, day2]

    # ##end of data that will be replaced

##############beginning of scraping code from weather underground#########
    location = "us/vt/st.-albans"
    year = "2019"
    month = "8"

    html = open("https://www.wunderground.com/history/monthly/#{location}/KPBG/date/#{year}-#{month}")
    doc = Nokogiri::HTML(html)
    binding.pry

  end
  


 # "https://api.darksky.net/forecast/[key]/#{latitude},#{longitude},#{time}"


  def self.color_chart_data
    # may need to hard code the color chart conversions and conditional logic
    # call on self.scrape_yarn_colors method to get url for each color(optional)
  end



  def self.scrape_yarn_colors
    #low priority, can remove url attribute if needed
  end
end
