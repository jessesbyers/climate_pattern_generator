class ClimatePatternGenerator::CLI
  attr_accessor :date, :temperature, :color, :year, :zip
  attr_reader :url, :next_day_url
  @@search_terms = []

  def call
    puts "Welcome to the Climate Pattern Generator"
    # get_search_terms
    options
    menu_loop
    goodbye
  end

# need to add rescue and search term criteria
  def get_search_terms
    @@search_terms.clear
    puts "enter a year"
    self.year = gets.strip
    puts "enter a zip code"
    self.zip = gets.strip
    @@search_terms << self.zip
    @@search_terms << self.year
  end

  def self.search_terms
    @@search_terms
  end

  def options
    puts "What would you like to do?"
    puts "1. STEP 1: Create a custom pattern"
    puts "2. STEP 2: View and print your pattern"
    puts "3. STEP 3: Read background information about the Tempestry Project"
    puts "4. STEP 4: View the color chart"
    puts "Type a number to make your choice."
  end

  def menu_loop
    input = nil
    while input != "exit"
      puts "Type exit or back at any time."
      input = gets.strip

      case input
      when "1"
        get_search_terms
        options
      when "2"
        puts "Here is your pattern for your location and year"
        list_data
        puts "================ end of data ========================"
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
    puts "Here is your dialy maximum temperature data for zip code #{self.zip}, #{self.year}."
    puts "Row #  Date - Temperature - Color - Row Complete?"
    ClimatePatternGenerator::Data.scrape_day.each.with_index(1) do |day, i|
      puts "#{i}. #{day.date} - #{day.temperature.to_i} - #{day.color} - ________"
    end
  end
end
