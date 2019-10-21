class ClimatePatternGenerator::CLI
  attr_accessor :year, :zip, :pattern
  attr_reader :url, :next_day_url
  @@search_terms = []

  def call
    welcome
    get_search_terms
    options
    menu_loop
    # goodbye
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
    puts "1. Preview pattern"
    puts "2. Continue printing full pattern"
    puts "3. Read more about the Tempestry Project and yarn colors"
    puts "4. Save pattern"
    puts "5. Enter new search terms"
    puts "Type a number to make your choice."
    puts "Type exit or back at any time."
  end

  def menu_loop
    input = nil
    while input != "exit"
      input = gets.strip
      case input
        when "1"
          ClimatePatternGenerator::Data.all.clear
          puts "Please wait while we PREVIEW your pattern"
          first_day
          2.times do
            scrape_print_day
          end
          puts "If this preview looks correct, choose 2 to continue printing full pattern "
          options

          when "2"
            ClimatePatternGenerator::Data.all.clear
            puts "Please wait while we generate your pattern"
            first_day
            if Date.leap?(self.year.to_i)
              365.times do #365
                scrape_print_day
              end
            else
              364.times do  #364
                scrape_print_day
              end
            end
            options

          when "3"
            puts "more info coming soon"
            options

          when "4"
            save_pattern
            options

          when "5"
            call

          when "exit"
            goodbye

          else
            options
          end
       end
     end

  def first_day
    ClimatePatternGenerator::Data.scrape_first_day
    sleep 4
    list_day
  end

  def scrape_print_day
    ClimatePatternGenerator::Data.scrape_next_day
    sleep 4
    list_next_day
  end

  def welcome
    puts "Welcome to the Climate Pattern Generator"
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
        puts "________   #{day.date}   #{day.temperature.to_i} deg. F       #{day.color}"
      end
    end
  end

  def list_next_day
    day = ClimatePatternGenerator::Data.all.last
    puts "________   #{day.date}   #{day.temperature.to_i} deg. F       #{day.color}"
  end

  def save_pattern
    self.pattern = []
    self.pattern << ClimatePatternGenerator::Data.all
    puts "You have saved your pattern for zip code #{self.zip}, year #{self.year}."
  end

end
