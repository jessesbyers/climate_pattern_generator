class ClimatePatternGenerator::Dataset
  attr_accessor :date, :temperature, :color, :url

  def self.print
    self.scrape_data
  end

  def self.scrape_data
    daily_data = []
    daily_data << self.scrape_date_and_temp
    # daily_data << color_chart_data
    #can probably take out flatten once scrape method is working
    daily_data.flatten

  end

  def self.scrape_date_and_temp
    zip = "05478"
    year = "2000"

    url = "https://www.almanac.com/weather/history/zipcode/#{zip}/#{year}-01-01"
    html = open(url)
    doc = Nokogiri::HTML(html)

    url_stem = "https://www.almanac.com"
    next_day = doc.css("td.nextprev_next a").attribute("href").value
    next_day_url = url_stem + next_day
    next_year = (year.to_i + 1).to_s

    while next_day_url != "https://www.almanac.com/weather/history/zipcode/#{zip}/#{next_year}-01-01"
      date = doc.css("div.print-no form").attr("action").value.split("/")[-1]
      temperature = doc.css("table.weatherhistory_results td p span.value").children[2]
      daily_data << [date, temperature]
      url = next_day_url
      html = open(url)
      doc = Nokogiri::HTML(html)
    end
    # temperature = doc.css("table.weatherhistory_results").first.children.text.split[5].gsub("Temperature", "")

         ###need to use next day button to iterate through pages and collect daily max temp


binding.pry


    # ### this data will be replaced by farmers almanac data once scraping works
    #
    day1 = self.new
    day1.date = date
    day1.temperature = temperature
    day1.color = "fake color"

    day2 = self.new
    day2.date = "fake date"
    day2.temperature = "fake temperature"
    day2.color = "fake color"
     ##end of data that will be replaced

    # [day1, day2]
    daily_data
  end

  # def color_chart_data
  #   # need to hard code the color chart conversions and conditional logic
  #   color_chart = [
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #     {:color => , :min => , :max => },
  #   ]
  # end

end



# ##############beginning of scraping code from weather underground#########
# location = "us/vt/st.-albans"
# year = "2019"
# month = "8"
#
# # browser = Watir::Browser.start "https://www.wunderground.com/history/monthly/#{location}/KPBG/date/#{year}-#{month}"
# binding.pry
#
#
# html = open("https://www.wunderground.com/history/monthly/#{location}/KPBG/date/#{year}-#{month}")
# doc = Nokogiri::HTML(html)

#     # month = doc.css("body content-wrap right-side-nav")
#     # doc.css("div.observation-table table.days")
#     # doc.css("div.observation-table")
#     # div.observation-table table.days tr
#     # day =
#     # temp =

# doc.css("div.city-body div.row.city-history-observation div div:nth-child(1) div div city-history-observation div div.observation-table table tbody tr td:nth-child(2) table tbody tr:nth-child(2) td:nth-child(1)")
