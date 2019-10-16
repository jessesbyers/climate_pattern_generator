class ClimatePatternGenerator::CLI
  attr_accessor :date, :temperature, :color, :year, :zip
  attr_reader :url, :next_day_url
  @@search_terms = []

  def call
    welcome
    get_search_terms
    options
    menu_loop
    goodbye
  end

  def welcome
    puts "Welcome to the Climate Pattern Generator"
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
      ClimatePatternGenerator::Data.scrape_first_day
      puts "here are some directions... and info about the Tempestry project"
      puts "Please wait while we generate your pattern"
  end

  def self.search_terms
    @@search_terms
  end

  def options
    puts "What would you like to do next?"
    puts "1. Print pattern"
    puts "2. Read more about the Tempestry Project and yarn colors"
    puts "Type a number to make your choice."
  end

  def menu_loop
    input = nil
    while input != "exit"
      puts "Type exit or back at any time."
      input = gets.strip
      case input

        when "1"
          list_day
          365.times do
            ClimatePatternGenerator::Data.scrape_next_day
            sleep 4
            list_next_day
          end
          options

        when "2"
          puts "more info coming soon"
          options

        else
          options
        end
     end
  end

  def goodbye
    puts "Thank you for using the Climate Pattern Generator"
  end

  def list_day
    puts "Here is your daily maximum temperature data for zip code #{self.zip}, year #{self.year}."
    puts "Complete?  Date         Temperature     Yarn Color"
    ClimatePatternGenerator::Data.all.each.with_index(1) do |day, i|
      if ClimatePatternGenerator::Data.all == nil
        puts "Please try again. Enter a valid zip code and any year between 1945 and the current year."
        get_search_terms
      else
        # puts "________   #{i}.     #{day.date}   #{day.temperature.to_i} deg. F       #{day.color}"
        puts "________   #{day.date}   #{day.temperature.to_i} deg. F       #{day.color}"
      end
    end
  end

  def list_next_day
    next_day = ClimatePatternGenerator::Data.all.last
    puts "________  #{next_day.date}   #{next_day.temperature.to_i} deg. F       #{next_day.color}"
  end
end

# puts "============================= Please wait while more data is loaded =================================================="
