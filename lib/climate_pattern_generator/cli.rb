class ClimatePatternGenerator::CLI
  attr_accessor :year, :zip
  @@all = []

  def call
    welcome
    get_search_terms
    options1
    menu_loop
  end

  def get_search_terms
    puts ""
    puts "SEARCH for daily weather data for a valid U.S. zip code, and a year between 1945 and the current year."
    @@all.clear
    puts ""
    puts "Enter a 5-digit zip code"
    self.zip = gets.strip
    if self.zip.size != 5
      self.zip = 12193
      puts ""
      puts "That does not appear to be a valid zip code. Check the preview, or enter new search terms."
      puts ""
    end
    puts ""
    puts "Enter a year"
    self.year = gets.strip
    if self.year.size != 4
      self.year = 1900
      puts ""
      puts "That does not appear to be a valid year. Check the preview, or enter new search terms."
      puts ""
    end
    @@all << self
  end

  def choose_day
    puts ""
    puts "Choose a row number to see full daily weather information for that day"
    puts ""
    input = gets.strip.to_i
    ClimatePatternGenerator::Weather.all.each.with_index(1) do |day, i|
      if input == i
        puts ""
        puts "        Here is your daily weather snapshot"
        puts ""
        puts "        DATE:               #{day.date}"
        puts "        LOCATION:           #{day.location_name}"
        puts "        WEATHER STATION:    #{day.weather_station}"
        puts ""
        puts "    MAXIMUM TEMPERATURE:    #{day.max_temp} #{day.temp_units}"
        puts "    MINIMUM TEMPERATURE:    #{day.min_temp} #{day.temp_units}"
        puts "    MEAN TEMPERATURE:       #{day.mean_temp} #{day.temp_units}"
        puts ""
        puts ""
        puts "    PRECIPITATION:          #{day.precipitation}"
        puts ""
        puts "        DATA SOURCE:        The Old Farmer's Almanac"
        puts "                            https://www.almanac.com/weather/history"
        puts ""
      end
    end
  end

  def options1
    puts ""
    puts "What would you like to do?"
    puts ""
    puts "  P. PREVIEW pattern"
    puts "  S. SEARCH for a new year and zip code"
    puts ""
    puts "Type a letter to make your choice. Type EXIT at any time."
    puts ""
  end

  def options2
    puts ""
    puts "What would you like to do?"
    puts ""
    puts "  C. CREATE and print full pattern"
    puts "  S. SEARCH for a new year and zip code"
    puts ""
    puts "Type a letter to make your choice. Type EXIT at any time."
    puts ""
  end

  def options3
    puts ""
    puts "What would you like to do?"
    puts ""
    puts "  V. VIEW detailed daily temperature information"
    puts "  R. RE-PRINT full pattern"
    puts "  S. SEARCH for a new year and zip code"
    puts ""
    puts "Type a letter to make your choice. Type EXIT at any time."
    puts ""
  end

  def menu_loop
    input = nil
    while input != "EXIT" && input != "exit"
      input = gets.strip.upcase
      case input
        when "P" || "p"
          puts ""
          puts "Please wait while we PREVIEW your pattern"
          puts ""
          ClimatePatternGenerator::Weather.preview
          if ClimatePatternGenerator::Weather.preview_all[0].date == nil
            puts ""
            puts "  ERROR: Please try again. Weather history data is not available for the date and location you have selected."
            puts ""
          else
            print_preview
            puts ""
            puts "If this preview looks correct, choose C to create a pattern for the entire year"
            puts ""
          end
          options2

        when "S" || "s"
          get_search_terms
          options1

        when "C" || "c"
          puts ""
          puts "Please wait about 20 minutes while we CREATE your pattern"
          puts ""
          puts "While you are waiting, learn more about the Tempestry Project by watching this video: https://youtu.be/30nG81Fu7yg"
          puts ""
          ClimatePatternGenerator::Weather.year
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
    puts ""
    puts "Welcome to the Climate Pattern Generator"
    puts ""
    puts "The Climate Pattern Generator will create a custom knitting or crochet pattern based on the daily maximum temperature for a year."
    puts "Each yarn color represents a 5-degree range of temperature."
    puts ""
  end

  def goodbye
    puts ""
    puts "Thank you for using the Climate Pattern Generator"
    puts ""
  end

  def self.all
    @@all
  end

  def print_preview
    if ClimatePatternGenerator::Scraper.all == nil
      puts ""
      puts "  ERROR: Please try again. Weather history data is not available for the date and location you have selected."
      puts ""
      get_search_terms
    else
      puts ""
      puts "    Here is your daily maximum temperature data for #{ClimatePatternGenerator::Weather.preview_all[0].location_name}."
      puts ""
      puts "    Complete?  Row #    Date           Max Temperature    Yarn Color"
      puts ""
      ClimatePatternGenerator::Weather.preview_all.each.with_index(1) do |day, i|
        if day.max_temp.to_f.round.between?(0, 9)
          temp_spacer = "  "
        elsif day.max_temp.to_f.round.between?(10, 99) || day.max_temp.between?(-9, -1)
          temp_spacer = " "
        else
          temp_spacer = ""
        end
        puts "    ________   #{i}.       #{day.date}     #{temp_spacer}#{day.max_temp.to_f.round} #{day.temp_units}             #{day.color}"
      end
    end
    puts ""
  end

  def print_year
    puts ""
    puts "    Here is your complete knitting pattern for #{ClimatePatternGenerator::Weather.all[0].location_name}."
    puts ""
    puts "    Complete?  Row #    Date             Max Temperature    Yarn Color"
    puts ""
    ClimatePatternGenerator::Weather.all.each.with_index(1) do |day, i|
      if ClimatePatternGenerator::Scraper.all == nil
        puts ""
        puts "  ERROR: Please try again. Weather history data is not available for the date and location you have selected."
        puts ""
        get_search_terms
      else
        if i.between?(1, 9)
          row_spacer = "  "
        elsif i.between?(10, 99)
          row_spacer = " "
        else
          row_spacer = ""
        end
        if day.max_temp.to_f.round.between?(0, 9)
          temp_spacer = "  "
        elsif day.max_temp.to_f.round.between?(10, 99) || day.max_temp.to_f.round.between?(-9, -1)
          temp_spacer = " "
        else
          temp_spacer = ""
        end
        puts "    ________   #{row_spacer}#{i}.     #{day.date}       #{temp_spacer}#{day.max_temp.to_f.round} #{day.temp_units}             #{day.color}"
      end
    end
    puts ""
  end

  def self.zip
    @@all[0].zip
  end

  def self.year
    @@all[0].year
  end
end
