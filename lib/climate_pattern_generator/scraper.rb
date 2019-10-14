class ClimatePatternGenerator::Data
  attr_accessor :date, :url, :temperature, :next_day_url, :color

  @@year_data = []

# self.scrape_day works, but need to iterate to get rest of year
  def self.scrape_day
    zip = "05478"
    year = "2000"
    next_year = (year.to_i + 1).to_s

    url = "https://www.almanac.com/weather/history/zipcode/#{zip}/#{year}-01-01"

    html = open(url)
    doc = Nokogiri::HTML(html)
    day = self.new
    day.date = doc.css("div.print-no form").attr("action").value.split("/")[-1]
    day.temperature = doc.css("table.weatherhistory_results td p span.value").children[2].text
    day.color = "fake color"
    day.url = url
    day.next_day_url = "https://www.almanac.com" + doc.css("td.nextprev_next a").attribute("href").value
    @@year_data << day

    # while day.next_day_url != "https://www.almanac.com/weather/history/zipcode/#{zip}/#{next_year}-01-01"
    #   self.scrape_next_day
    # end
    @@year_data
  end

  # def self.scrape_next_day
  #   url = @@year_data[-1].url
  #   html = open(url)
  #   doc = Nokogiri::HTML(html)
  #   day = self.new
  #   day.date = doc.css("div.print-no form").attr("action").value.split("/")[-1]
  #   day.temperature = doc.css("table.weatherhistory_results td p span.value").children[2].text
  #   day.color = "fake color"
  #   day.url = url
  #   day.next_day_url = "https://www.almanac.com" + doc.css("td.nextprev_next a").attribute("href").value
  #   @@year_data << day
  #   @@year_data
  # end

  def self.scrape_data
    @@year_data << self.scrape_day
    @@year_data
  end

  def self.all
    @@year_data
  end
end

# def initialize
#   @date = date
#   @temperature = temperature
#   # @color = color
#   @url = url
#   @next_day_url = next_day_url
# end

# def url=(url)
#   @url = url
#   # zip = "05478"
#   # year = "2000"
#   url = "https://www.almanac.com/weather/history/zipcode/#{zip}/#{year}-01-01"
# end

# def next_day_url=(next_day_url)
#   @next_day_url = next_day_url
#   html = open(url)
#   doc = Nokogiri::HTML(html)
#   next_day_url = "https://www.almanac.com" + doc.css("td.nextprev_next a").attribute("href").value
# end

#
