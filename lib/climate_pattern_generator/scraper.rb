class Scraper
  attr_accessor :date, :url, :max_temp, :min_temp, :mean_temp, :precipitation, :next_day_url, :color, :location_name, :weather_station
  @@data_attributes = {}

  def initialize(url)
    zip = CLI.search_terms[0]
    year = CLI.search_terms[1]
    url = "https://www.almanac.com/weather/history/zipcode/#{zip}/#{year}-01-01"
    html = open(url)
    doc = Nokogiri::HTML(html)
    @@data_attributes = {
      :date => doc.css("div.print-no form").attr("action").value.split("/")[-1],
      :location_name => doc.css("h1").children[-1].text.strip.gsub("Weather History for ", ""),
      :weather_station => doc.css("h2.weatherhistory_results_station").text.strip.gsub("For the ", ""),
      :max_temp => doc.css("table.weatherhistory_results td p span.value").children[2].text,
      :min_temp => doc.css("table.weatherhistory_results td p span.value").children[0].text,
      :mean_temp => doc.css("table.weatherhistory_results td p span.value").children[1].text,
      :color => Color.get_color,
      :url => url,
      :next_day_url => "https://www.almanac.com" + doc.css("td.nextprev_next a").attribute("href").value
    }
  end

  def self.all
    @@data_attributes
  end

  def self.clear
    @@data_attributes.clear
  end

end

  # def self.scrape_next_day(url)
  #   zip = CLI.search_terms[0]
  #   year = CLI.search_terms[1]
  #   url = self.all[-1].next_day_url
  #   html = open(url)
  #   doc = Nokogiri::HTML(html)
  #   day = self.new
  #
  #   day.date = doc.css("div.print-no form").attr("action").value.split("/")[-1]
  #   day.location_name = doc.css("h1").children[-1].text.strip.gsub("Weather History for ", "")
  #   day.weather_station = doc.css("h2.weatherhistory_results_station").text.strip.gsub("For the ", "")
  #   day.max_temp = doc.css("table.weatherhistory_results td p span.value").children[2].text
  #   day.min_temp = doc.css("table.weatherhistory_results td p span.value").children[0].text
  #   day.mean_temp = doc.css("table.weatherhistory_results td p span.value").children[1].text
  #   day.color = day.get_color
  #   day.date = doc.css("div.print-no form").attr("action").value.split("/")[-1]
  #   day.max_temp = doc.css("table.weatherhistory_results td p span.value").children[2].text
  #   day.color = day.get_color
  #   day.url = url
  #   day.next_day_url = "https://www.almanac.com" + doc.css("td.nextprev_next a").attribute("href").value
  #   @@year_data << day
  # end



  # @@color_chart = [
  #     ["Currant", 121, 1000],
  #     ["Garnet", 116, 120],
  #     ["Rooibos", 111, 115],
  #     ["Hollyberry", 106, 110],
  #     ["Firecracker", 101, 105],
  #     ["Cranberry", 96, 100],
  #     ["Red", 91, 95],
  #     ["Victorian", 86, 90],
  #     ["Papaya", 81, 85],
  #     ["Orange", 76, 80],
  #     ["Conch", 71, 75],
  #     ["Caution", 66, 70],
  #     ["Semolina", 61, 65],
  #     ["Creme Brulee", 56, 60],
  #     ["Green Tea", 51, 55],
  #     ["Peapod", 46, 50],
  #     ["Grass", 41, 45],
  #     ["Everglade", 36, 40],
  #     ["Tranquil", 31, 35],
  #     ["Calypso", 26, 30],
  #     ["Whirlpool", 21, 25],
  #     ["Baltic", 16, 20],
  #     ["Fjord", 11, 15],
  #     ["Ciel", 6, 10],
  #     ["Celestial", 1, 5],
  #     ["Sapphire", -4, 0],
  #     ["Solstice", -9, -5],
  #     ["Lullaby", -14, -10],
  #     ["Amethyst", -19, -15],
  #     ["Indigo", -24, -20],
  #     ["Blackberry", -29, -25],
  #     ["Coal", -1000, -30]
  #   ]
  #
  # def get_color
  #   color = ""
  #       @@color_chart.map do |color_row|
  #           if @max_temp.to_i >= color_row[1] && @max_temp.to_i <= color_row[2]
  #             @color = "#{color_row[0]}"
  #           end
  #         end
  #    @color
  #  end
