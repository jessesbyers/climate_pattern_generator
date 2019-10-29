class ClimatePatternGenerator::Scraper
  attr_accessor :year, :zip, :url, :date, :max_temp, :min_temp, :mean_temp, :next_day_url, :color, :location_name, :weather_station, :temp_units, :precipitation
  @@all = []

  def initialize
    self.zip = ClimatePatternGenerator::CLI.zip
    self.year = ClimatePatternGenerator::CLI.year

    if @@all == []
      self.url = "https://www.almanac.com/weather/history/zipcode/#{zip}/#{year}-01-01"
    else
      self.url = ClimatePatternGenerator::Scraper.all.last.next_day_url
    end

    scrape_attributes
  end

  def scrape_attributes
    html = open(self.url)
    doc = Nokogiri::HTML(html)

    if doc.css("p").first.text == "Weather history data is not available for the date you have selected."
      attributes = {}
    else
      attributes = {
        :date => doc.css("div.print-no form").attr("action").value.split("/")[-1],
        :location_name => doc.css("h1").children[-1].text.strip.gsub("Weather History for ", ""),
        :weather_station => doc.css("h2.weatherhistory_results_station").text.strip.gsub("For the ", ""),
        :next_day_url => "https://www.almanac.com" + doc.css("td.nextprev_next a").attribute("href").value,
        :min_temp => doc.css("table.weatherhistory_results tr.weatherhistory_results_datavalue td p").children[0].text,
        :mean_temp => doc.css("table.weatherhistory_results tr.weatherhistory_results_datavalue td p").children[3].text,
        :max_temp => doc.css("table.weatherhistory_results tr.weatherhistory_results_datavalue td p").children[6].text,
        :temp_units => doc.css("table.weatherhistory_results tr.weatherhistory_results_datavalue td p").children[2].text,
        :precipitation => doc.css("table.weatherhistory_results tr.weatherhistory_results_datavalue")[5].children.children.last.text
        }
      attributes.each {|key, value| self.send(("#{key}="), value)}
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
    if self.max_temp == "No data."
      self.max_temp = "No data available"
      self.min_temp = "No data available"
      self.mean_temp = "No data available"
      self.precipitation = "No data available"
      self.temp_units = ""
      self.color = "No data available"
    end
    if self.temp_units == "°C"
      self.max_temp = ((self.max_temp.to_f * 1.8) + 32).round
      self.min_temp = ((self.min_temp.to_f * 1.8) + 32).round
      self.mean_temp = ((self.mean_temp.to_f * 1.8) + 32).round
      self.temp_units = "°F"
    end
  end
end
