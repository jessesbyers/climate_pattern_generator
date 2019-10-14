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
    puts "What would you like to do?"
    puts "1. Print your pattern"
    puts "2. Read background information about the Tempestry Project"
    puts "3. View the color chart and yarn information"
    puts "Type a number to make your choice."
  end

  def menu_loop
    input = nil
    while input != "exit"
      puts "Type exit or back at any time."
      input = gets.strip
      case input
      when "1"
        list_data
      when "2"
        puts "here is info.... coming soon"
      when "3"
        puts "here is the color chart.... coming soon"
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
    puts "Row #  Date - Temperature - Color - Row Complete?"
    ClimatePatternGenerator::Data.all.each.with_index(1) do |day, i|
      if ClimatePatternGenerator::Data.all == nil
        puts "Please try again. Enter a valid zip code and any year between 1945 and the current year."
        get_search_terms
      else
        puts "#{i}. #{day.date} - #{day.temperature.to_i} - #{day.color} - ________"
        puts "==================== end of data ===================================="
      end
    end
  end
end
