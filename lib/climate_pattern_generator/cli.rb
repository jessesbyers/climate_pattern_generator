class CLI
  attr_accessor :year, :zip
  @@search_terms = []

  def call
    welcome
    get_search_terms
    options1
    menu_loop
  end

  def get_search_terms
    puts "SEARCH for daily weather data for a valid U.S. zip code, and a year between 1945 and the current year."
    @@search_terms.clear
    puts "Enter a 5-digit zip code"
    self.zip = gets.strip
    puts "Enter a year"
    self.year = gets.strip
    @@search_terms << self
  end

  def choose_day
    puts "Choose a row number to see full daily weather information for that day"
    input = gets.strip.to_i
    Weather.all.each.with_index(1) do |day, i|
      if input == i
        puts "Here is your daily weather snaphot for: #{day.date}"
        puts "Date: #{day.date}"
        puts "Location: #{day.location_name}"
        puts "Weather Station: #{day.weather_station}"
        puts ""
        puts "Daily Maximum Temperature: #{day.max_temp} degrees Fahrenheit"
        puts "Daily Minimum Temperature: #{day.min_temp} degrees Fahrenheit"
        puts "Daily Mean Temperature: #{day.mean_temp} degrees Fahrenheit"
        puts "Daily Total Precipitation: #{day.precipitation} inches"
        puts ""
        puts "Data Source: This data was scraped from The Old Farmer's Almanac at #{day.url}"
      end
    end
  end

  def self.search_terms
    @@search_terms
  end

  def options1
    puts "What would you like to do?"
    puts "P. PREVIEW pattern"
    puts "S. SEARCH for a new year and zip code"
    puts "Type a letter to make your choice."
    puts "Type exit or back at any time."
  end

  def options2
    puts "What would you like to do?"
    puts "C. CREATE and print full pattern"
    puts "S. SEARCH for a new year and zip code"
    puts "Type a letter to make your choice."
    puts "Type exit or back at any time."
  end

  def options3
    puts "What would you like to do?"
    puts "V. VIEW detailed daily weather information"
    puts "R. RE-PRINT full pattern"
    puts "S. SEARCH for a new year and zip code"
    puts "Type a letter to make your choice."
    puts "Type exit or back at any time."
  end

  def menu_loop
    input = nil
    while input != "EXIT" && input != "exit"
      input = gets.strip.upcase
      case input
        when "P" || "p"
          puts "Please wait while we PREVIEW your pattern"
          Weather.preview
          if Weather.preview_all[0].date == nil
            puts ""
            puts "ERROR: Please try again. Weather history data is not available for the date and location you have selected."
            puts " "
          else
            print_preview
            puts "If this preview looks correct, choose C to create a pattern for the entire year"
          end
          options2

        when "S" || "s"
          get_search_terms
          options1

        when "C" || "c"
          puts "Please wait about 20 minutes while we CREATE your pattern"
          puts "While you are waiting, learn more about the Tempestry Project by watching this video: https://youtu.be/30nG81Fu7yg"
          Weather.year
          print_year
          options3

        when "V" || "v"
          choose_day
          options3

        when "R" || "r"
          print_year
          options3

        when "EXIT" || "exit"
          goodbye

        else
          options1
        end
       end
     end

  def welcome
    puts "Welcome to the Climate Pattern Generator"
  end

  def goodbye
    puts "Thank you for using the Climate Pattern Generator"
  end

  def print_preview
    if Scraper.all == nil
      puts "ERROR: Please try again. Weather history data is not available for the date and location you have selected."
      get_search_terms
    else
      puts "Here is your daily maximum temperature data for #{Weather.preview_all[0].location_name}."
      puts "Complete?  Row #    Date           Max Temperature    Yarn Color"
      Weather.preview_all.each.with_index(1) do |day, i|
        puts "________   #{i}.       #{day.date}     #{day.max_temp} deg. F        #{day.color}"
      end
    end
  end

  def print_year
    puts "Here is your complete knitting pattern for #{Weather.all[0].location_name}."
    puts "Complete?  Row #    Date             Max Temperature    Yarn Color"
    Weather.all.each.with_index(1) do |day, i|
      if Scraper.all == nil
        puts "ERROR: Please try again. Weather history data is not available for the date and location you have selected."
        get_search_terms
      else
        if i.between?(1, 9)
          spacer = "  "
        elsif i.between?(10, 99)
          spacer = " "
        else
          spacer = ""
        end
        puts "________   #{spacer}#{i}.     #{day.date}       #{day.max_temp} deg. F        #{day.color}"
      end
    end
  end
end
