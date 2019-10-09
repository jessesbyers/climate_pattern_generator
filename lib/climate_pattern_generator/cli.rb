class ClimatePatternGenerator::CLI
  attr_accessor :date, :temperature, :color, :URL

  def call
    puts "Welcome to the Climate Pattern Generator"
    menu
    # list_data
    goodbye
  end

  def list_data
    # coded with fake data to start, will replace later
    date = "fake date"
    temperature = "fake temperature"
    color = "fake color"
    url = "fake url"
    puts "Complete?   Date      Temperature      Color       URL"
    puts "_________   #{date}   #{temperature}   #{color}    #{url}"
    puts "_________   #{date}   #{temperature}   #{color}    #{url}"
  end

  def menu
    puts "What would you like to do?"
    puts "1. Create a pattern by year"
    # ## will build for option 1, then add more features later
    # puts "2. Create a pattern by location"
    # puts "3. Create a pattern by year and location"
    puts "Type a number to make your choice. Type exit or back at any time."
    input = gets.strip

    while input != "exit"
      if input == "1"
        puts "Choose a year between 1900 and 2018"
        input = gets.to_i
        while input != "exit"

          if input >= 1900 && input <= 2018
            puts  "get_pattern_by_year method"
            puts "list_data method"
          else
            puts "Try again."
            menu
          end
        end

      elsif input == "2"
        puts "Please come back soon - this option is not yet available"
        menu

      elsif input == "3"
        puts "Please come back soon - this option is not yet available"
        menu

      # elsif input == "exit"
      #   puts "Goodbye!"
      else
        menu
      end

      if input == "exit"
        puts "Goodbye!"
      end
    end
  end

  def goodbye
    puts "Thank you for using the Climate Pattern Generator"
  end

end
