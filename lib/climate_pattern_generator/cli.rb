class ClimatePatternGenerator::CLI
  attr_accessor :date, :temperature, :color, :url

  def call
    puts "Welcome to the Climate Pattern Generator"
    # get_search_terms
    options
    menu_loop
    goodbye
  end

 #  def get_search_terms
 # #this method will ask for input, translate input into the right format,
 #  # and create instance variables to use while scraping
 #    # puts "enter a year"
 #    # @year = gets.strip
 #    # puts "enter a zip code"
 #    # @location = something....maybe use geocoder
 #  # need to flesh out based on what scraper needs
 #  end

  def options
    puts "What would you like to do?"
    puts "1. Create a pattern - your location, year 2000"
    # ## will build for option 1, then change to add custom scraping options
    puts "2. Create a pattern - your location, year 2010"
    puts "3. CUSTOM: Create a pattern - choose location and year"
    puts "Type a number to make your choice."
  end

  def menu_loop
    # f custom scraping works, this menu will be options for different layouts of data
    input = nil
    while input != "exit"
      puts "Type exit or back at any time."
      input = gets.strip

      case input
      when "1"
        puts "Here is your pattern for your location, year 2000"
        list_data
        puts "================ see data above ========================"
      when "2"
        puts "Please come back soon - this option is not yet available"
      when "3"
        puts "Please come back soon - this option is not yet available"
      else
        options
      end
    end
  end

  def goodbye
    puts "Thank you for using the Climate Pattern Generator"
  end

  def list_data
    @daily_data = ClimatePatternGenerator::Dataset.print
    @daily_data.each.with_index(1) do |data, i|
      puts "#{i}. #{data.date} - #{data.temperature} - #{data.color} - #{data.url}"
    end
  end
end
