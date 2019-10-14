class ClimatePatternGenerator::CLI
  attr_accessor :date, :temperature, :color, :year, :zip
  attr_reader :url, :next_day_url
  @@search_terms = []

  def call
    welcome
    get_search_terms
    ClimatePatternGenerator::Data.scrape_day
    options
    menu_loop
    goodbye
  end

  def welcome
    puts "Welcome to the Climate Pattern Generator"
    puts "here are some directions..."
  end

# need to add rescue/error message if invalid entry
  def get_search_terms
    directions = "Enter a a valid U.S. zip code, and a year between 1945 and the current year."
    @@search_terms.clear
    puts "Enter a zip code"
      self.zip = gets.strip
      @@search_terms << self.zip
    puts "Enter a year"
      self.year = gets.strip
      @@search_terms << self.year
  end

  def self.search_terms
    @@search_terms
  end

  def options
    puts "Please wait while your pattern is generated."
    puts "What would you like to do next?"
    puts "1. READ background information about the Tempestry Project"
    puts "2. VIEW the color chart and yarn information"
    puts "3. PRINT your pattern"
    puts "Type a number to make your choice."
  end

  def menu_loop
    input = nil
    while input != "exit"
      puts "Type exit or back at any time."
      input = gets.strip
      case input
        when "1"
          puts "here is info.... coming soon"
        when "2"
          puts "here is the color chart.... coming soon"
        when "3"
          list_data
        else
          options
        end
     end
  end

  def goodbye
    puts "Thank you for using the Climate Pattern Generator"
  end

  def list_data
    puts "Here is your daily maximum temperature data for zip code #{self.zip}, year #{self.year}."
    puts "Complete?  Row #  Date         Temperature     Yarn Color"
    ClimatePatternGenerator::Data.all.each.with_index(1) do |day, i|
      if ClimatePatternGenerator::Data.all == nil
        puts "Please try again. Enter a valid zip code and any year between 1945 and the current year."
        get_search_terms
      else
        puts "________   #{i}.     #{day.date}   #{day.temperature.to_i} deg. F       #{day.color}"
      end
    end
    puts "============================= end of data =================================================="
  end
end
