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

end
