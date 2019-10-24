# get_color working from hash, but not Color objects
class Scraper
  attr_accessor :date, :url, :max_temp, :min_temp, :mean_temp, :precipitation, :next_day_url, :color, :location_name, :weather_station
  @@all = []

  def initialize
    zip = CLI.search_terms[0].zip
    year = CLI.search_terms[0].year
    if @@all == []
      url = "https://www.almanac.com/weather/history/zipcode/#{zip}/#{year}-01-01"
    else
      url = Scraper.all.last.next_day_url
    end
    html = open(url)
    doc = Nokogiri::HTML(html)
    if doc.css("p").first.text == "Weather history data is not available for the date you have selected."
      data_attributes = {}
    else
      data_attributes = {
        :date => doc.css("div.print-no form").attr("action").value.split("/")[-1],
        :location_name => doc.css("h1").children[-1].text.strip.gsub("Weather History for ", ""),
        :weather_station => doc.css("h2.weatherhistory_results_station").text.strip.gsub("For the ", ""),
        :max_temp => doc.css("table.weatherhistory_results td p span.value").children[2].text,
        :min_temp => doc.css("table.weatherhistory_results td p span.value").children[0].text,
        :precipitation => doc.css("table.weatherhistory_results td p span.value").children[5].text,
        :mean_temp => doc.css("table.weatherhistory_results td p span.value").children[1].text,
        :color => " ", #color.new methods not working yet
        :url => url,
        :next_day_url => "https://www.almanac.com" + doc.css("td.nextprev_next a").attribute("href").value
      }
      data_attributes.each {|key, value| self.send(("#{key}="), value)}
      self.color = get_color
      @@all << self
    end
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end

def get_color
  color_chart = [
    ["Currant", 121, 1000],
    ["Garnet", 116, 120],
    ["Rooibos", 111, 115],
    ["Hollyberry", 106, 110],
    ["Firecracker", 101, 105],
    ["Cranberry", 96, 100],
    ["Red", 91, 95],
    ["Victorian", 86, 90],
    ["Papaya", 81, 85],
    ["Orange", 76, 80],
    ["Conch", 71, 75],
    ["Caution", 66, 70],
    ["Semolina", 61, 65],
    ["Creme Brulee", 56, 60],
    ["Green Tea", 51, 55],
    ["Peapod", 46, 50],
    ["Grass", 41, 45],
    ["Everglade", 36, 40],
    ["Tranquil", 31, 35],
    ["Calypso", 26, 30],
    ["Whirlpool", 21, 25],
    ["Baltic", 16, 20],
    ["Fjord", 11, 15],
    ["Ciel", 6, 10],
    ["Celestial", 1, 5],
    ["Sapphire", -4, 0],
    ["Solstice", -9, -5],
    ["Lullaby", -14, -10],
    ["Amethyst", -19, -15],
    ["Indigo", -24, -20],
    ["Blackberry", -29, -25],
    ["Coal", -1000, -30]
  ]
    color_chart.map do |color_row|
      if self.max_temp.to_i >= color_row[1] && self.max_temp.to_i <= color_row[2]
        self.color = "#{color_row[0]}"
      end
    end
   self.color
  end
end

# need to revise method once Color.new(colors is working properly)
  # def get_color
  #   colors = Color.colors
  #   Color.new(colors)
  #   Color.all.each do |color|
  #     if self.max_temp.to_i >= color.min && self.max_temp.to_i <= color.max
  #       self.color = color
  #     end
  #   end
  # self.color
  # end
