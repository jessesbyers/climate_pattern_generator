# need to put new class methods back into CLI class

class CLI
  attr_accessor :year, :zip, :pattern, :attributes
  @@search_terms = []

  def call
    welcome
    get_search_terms
    options1
    menu_loop
  end

  def get_search_terms
    puts "Enter a a valid U.S. zip code, and a year between 1945 and the current year."
    @@search_terms.clear
    puts "Enter a zip code"
      self.zip = gets.strip
      @@search_terms << self.zip
    puts "Enter a year"
      self.year = gets.strip
      @@search_terms << self.year
  end

  def choose_day
    puts "Choose a row number to see full weather info for that day"
    input = gets.strip.to_i
    Weather.all.each.with_index(1) do |day, i|
      if input == i
        puts "Here is your daily weather snaphot for: #{day.date}"
        puts "Date: #{day.date}"
        puts "Location: #{day.location_name}"
        puts "Weather Station: #{day.weather_station}"
        puts ""
        puts "Daily Maximum Temperature: #{day.max_temp}"
        puts "Daily Minimum Temperature: #{day.min_temp}"
        puts "Daily Mean Temperature: #{day.mean_temp}"
        puts "Daily Total Precipitation: #{day.precipitation}"
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
    puts "1. Preview pattern"
    puts "2. Enter new search terms"
    puts "Type a number to make your choice."
    puts "Type exit or back at any time."
  end

  def options2
    puts "What would you like to do?"
    puts "1. Preview pattern"
    puts "2. Enter new search terms"
    puts "3. Continue printing full pattern"
    puts "4. Choose a day to see detailed weather information"
    puts "5. Re-print full pattern"
    puts "Type a number to make your choice."
    puts "Type exit or back at any time."
  end

  def menu_loop
    input = nil
    while input != "exit"
      input = gets.strip
      case input
        when "1"
          puts "Please wait while we PREVIEW your pattern"
          Weather.preview
          print_preview
          puts "If this preview looks correct, choose 3 to create a pattern for the entire year"
          options2

          when "2"
            get_search_terms
            options1

          when "3"
            puts "Please wait about 20 minutes while we generate your pattern"
            puts "While you are waiting, learn more about the Tempestry Project by watching this video: https://youtu.be/30nG81Fu7yg"
            Weather.year
            print_year
            options2

          when "4"
            choose_day
            options2

          when "5"
            print_year
            options2

          when "exit"
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
       puts "Here is your daily maximum temperature data for zip code #{CLI.search_terms[0]}, year #{CLI.search_terms[1]}."
       puts "Complete?  Row #      Date         Max Temperature    Yarn Color"
       Weather.preview_all.each.with_index(1) do |day, i|
         if Scraper.all == nil
           puts "Please try again. Enter a valid zip code and any year between 1945 and the current year."
           get_search_terms
         else
           puts "________   #{i}.         #{day.date}   #{day.max_temp} deg. F        #{day.color}"
         end
       end
     end

     def print_year
       puts "Here is your daily maximum temperature data for zip code #{CLI.search_terms[0]}, year #{CLI.search_terms[1]}."
       puts "Complete?  Row #      Date         Max Temperature    Yarn Color"
       Weather.all.each.with_index(1) do |day, i|
         if Scraper.all == nil
           puts "Please try again. Enter a valid zip code and any year between 1945 and the current year."
           get_search_terms
         else
           puts "________   #{i}.         #{day.date}   #{day.max_temp} deg. F        #{day.color}"
         end
       end
     end
end
