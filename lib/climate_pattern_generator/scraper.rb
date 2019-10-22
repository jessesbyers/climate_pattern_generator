class Scraper
  attr_accessor :date, :url, :max_temp, :min_temp, :mean_temp, :precipitation, :next_day_url, :color, :location_name, :weather_station
  @@data_attributes = {}

  def initialize
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
      :color => get_color,
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

# need to test method
  # def get_color
  #   colors = Color.colors
  #   Color.new(colors)
  #   Color.all.each do |color|
  #     if max_temp.to_i >= color.min && max_temp.to_i <= color.max
  #       @color = color
  #     end
  #   end
  # end
end
