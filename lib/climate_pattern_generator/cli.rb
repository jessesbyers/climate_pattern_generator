# class ClimatePatternGenerator::CLI
class CLI
  attr_accessor :year, :zip, :pattern
  @@search_terms = []

  def call
    welcome
    get_search_terms
    options1
    menu_loop
  end

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
    puts "4. Save pattern"
    puts "5. Learn more about the Tempestry Project and yarn colors"
    puts "Type a number to make your choice."
    puts "Type exit or back at any time."
  end

  def menu_loop
    input = nil
    while input != "exit"
      input = gets.strip
      case input
        when "1"
          Scraper.all.clear
          puts "Please wait while we PREVIEW your pattern"
          first_day
          2.times do
            scrape_print_day
          end
          puts "If this preview looks correct, choose 3 to continue printing full pattern "
          options2

          when "2"
            call

          when "3"
            Scraper.all.clear
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
            options2

          when "4"
            save_pattern
            options2

          when "5"
            puts "more info coming soon"
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

     def save_pattern
       self.pattern = []
       self.pattern << Scraper.all
       puts "You have saved your pattern for zip code #{self.zip}, year #{self.year}."
     end




  def first_day
    Scraper.scrape_first_day
    sleep 4
    list_day
  end

  def scrape_print_day
    Scraper.scrape_next_day
    sleep 4
    list_next_day
  end



  def list_day
    puts "Here is your daily maximum temperature data for zip code #{self.zip}, year #{self.year}."
    puts "Complete?  Date         Temperature     Yarn Color"
    Scraper.all.each.with_index(1) do |day, i|
      if Scraper.all == nil
        puts "Please try again. Enter a valid zip code and any year between 1945 and the current year."
        get_search_terms
      else
        puts "________   #{day.date}   #{day.max_temp.to_i} deg. F       #{day.color}"
      end
    end
  end

  def list_next_day
    day = Scraper.all.last
    puts "________   #{day.date}   #{day.max_temp.to_i} deg. F       #{day.color}"
  end

end
