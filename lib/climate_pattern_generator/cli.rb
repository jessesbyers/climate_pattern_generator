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
    puts "5. Choose a day to see full weather info"
    puts "Type a number to make your choice."
    puts "Type exit or back at any time."
  end

  def menu_loop
    input = nil
    while input != "exit"
      input = gets.strip
      case input
        when "1"
          Weather.preview_all.clear
          puts "Please wait while we PREVIEW your pattern"
          Weather.preview
          print_preview
          puts "If this preview looks correct, choose 3 to continue printing full pattern "
          options2

          when "2"
            get_search_terms
            options1

          when "3"
            Weather.all.clear
            puts "Please wait while we generate your pattern"
            # first_day
            # if Day_data.leap?(self.year.to_i)
            #   365.times do #365
            #     scrape_print_day
            #   end
            # else
            #   364.times do  #364
            #     scrape_print_day
            #   end
            # end
            options2

          when "4"
            # save_pattern
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

     def print_preview
       puts "Here is your daily maximum temperature data for zip code #{CLI.search_terms[0]}, year #{CLI.search_terms[1]}."
       puts "Complete?  Row #      Date         Max Temperature     Yarn Color"
       Weather.preview_all.each.with_index(1) do |day, i|
         if Scraper.all == nil
           puts "Please try again. Enter a valid zip code and any year between 1945 and the current year."
           get_search_terms
         else
           puts "________   #{i}.  #{day.date}   #{day.max_temp} deg. F       #{day.color}"
         end
       end
     end

    #  def save_pattern
    #    self.pattern = []
    #    self.pattern << Day_data.all
    #    puts "You have saved your pattern for zip code #{self.zip}, year #{self.year}."
    #  end
end
