class ClimatePatternGenerator::Scraper
  attr_accessor :date, :url, :max_temp, :min_temp, :mean_temp, :next_day_url, :color, :location_name, :weather_station, :temp_units, :precipitation
  @@all = []

  def initialize
    zip = ClimatePatternGenerator::CLI.search_terms[0].zip
    year = ClimatePatternGenerator::CLI.search_terms[0].year

    if @@all == []
      url = "https://www.almanac.com/weather/history/zipcode/#{zip}/#{year}-01-01"
    else
      url = ClimatePatternGenerator::Scraper.all.last.next_day_url
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
        :url => url,
        :next_day_url => "https://www.almanac.com" + doc.css("td.nextprev_next a").attribute("href").value,
        :min_temp => doc.css("table.weatherhistory_results tr.weatherhistory_results_datavalue td p").children[0].text,
        :mean_temp => doc.css("table.weatherhistory_results tr.weatherhistory_results_datavalue td p").children[3].text,
        :max_temp => doc.css("table.weatherhistory_results tr.weatherhistory_results_datavalue td p").children[6].text,
        :temp_units => doc.css("table.weatherhistory_results tr.weatherhistory_results_datavalue td p").children[8].text,
        :precipitation => doc.css("table.weatherhistory_results tr.weatherhistory_results_datavalue")[5].children.children.last.text
      }
binding.pry
      data_attributes.each {|key, value| self.send(("#{key}="), value)}
      self.color = get_color
      convert_temp
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
    ClimatePatternGenerator::Color.all.each do |color_row|
      if self.max_temp.to_f.round >= color_row.min && self.max_temp.to_f.round <= color_row.max
        self.color = color_row.color
      end
    end
   self.color
  end

  def convert_temp
    if self.temp_units == "°C"
      self.max_temp = ((self.max_temp.to_f * 1.8) + 32).round
      self.min_temp = ((self.min_temp.to_f * 1.8) + 32).round
      self.min_temp = ((self.min_temp.to_f * 1.8) + 32).round
      self.temp_units = "°F"
    end
  end
end

# :max_temp => doc.css("table.weatherhistory_results td p span.value").children[2].text.to_f,
# :min_temp => doc.css("table.weatherhistory_results td p span.value").children[0].text.to_f,
# :mean_temp => doc.css("table.weatherhistory_results td p span.value").children[1].text.to_f,
# :temp_units => doc.css("table.weatherhistory_results td p span.units").children[2].text,
# # :max_temp => doc.css("table.weatherhistory_results tr.weatherhistory_results_datavalue td p span")[4].children.text,
# :min_temp => doc.css("table.weatherhistory_results tr.weatherhistory_results_datavalue td p span")[0].children.text,
# :mean_temp => doc.css("table.weatherhistory_results tr.weatherhistory_results_datavalue td p span")[2].children.text,
