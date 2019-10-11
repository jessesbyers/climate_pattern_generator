

class ClimatePatternGenerator::Dataset
  attr_accessor :date, :temperature, :color, :url

  def self.print
    self.scrape_data
  end

  def self.scrape_data
    daily_data = []
    daily_data << self.scrape_date_and_temp
    #     will also need to scrape color and url eventually
    # daily_data << color_chart_data
    #can probably take out flatten once scrape method is working
    daily_data.flatten

  end

  def self.scrape_date_and_temp
    # ### this data will be replaced by weather underground OR dark sky api once scraping works
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
    # ##end of data that will be replaced

    # # need to scrape a page for every month of the year...
        location = "us/vt/st.-albans"
        year = "2019"
        month = "8"

        html = open("https://www.wunderground.com/history/monthly/#{location}/KPBG/date/#{year}-#{month}")
        doc = Nokogiri::HTML(html)
        binding.pry
    #
    #     # month = doc.css("body content-wrap right-side-nav")
    #     # doc.css("div.observation-table table.days")
    #     # doc.css("div.observation-table")
    #     # div.observation-table table.days tr
    #     # day =
    #     # temp =

  end

  # def color_chart_data
  #   # need to hard code the color chart conversions and conditional logic
  #   # call on self.scrape_yarn_colors method to get url for each color(optional)
  #   color_chart = [
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #     {:color => , :url => , :min => , :max => },
  #   ]
  # end

#   def self.scrape_yarn_colors
#     #low priority, can remove url attribute if needed
#     html = open("https://www.knitpicks.com/yarn/wool-of-the-andes-worsted-yarn/c/5420103")
#     doc = Nokogiri::HTML(html)
#     binding.pry
#
# # gets semi-formatted array of colors
# # colors = doc.css("body div.cozy-buy-grid").first.css("div b").inner_text.delete("  ").split("\n")
# #??  url = doc.css("body div.cozy-buy-grid_image").first.attr("img").jpg
#
#   end
end



# ##############beginning of scraping code from weather underground#########
