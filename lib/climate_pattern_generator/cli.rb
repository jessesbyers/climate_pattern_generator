class ClimatePatternGenerator::CLI
  attr_accessor :date, :temperature, :color, :URL

  def call
    puts "Welcome to the Climate Pattern Generator"
    options
    menu_loop
    # list_data
    goodbye
  end

  def options
    puts "What would you like to do?"
    puts "1. Create a pattern by year"
    # ## will build for option 1, then add more later
    # puts "2. Create a pattern by location"
    # puts "3. Create a pattern by year and location"
    puts "Type a number to make your choice."
  end

  def menu_loop
    input = nil

    while input != "exit"
      puts "Type exit or back at any time."
      input = gets.strip
      case input

      when "1"
        puts "Choose a year between 1900 and 2018"
          input = gets.strip
        #add logic for choosing year
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
    # coded with fake data to start, will replace later
    date = "fake date"
    temperature = "fake temperature"
    color = "fake color"
    url = "fake url"
    puts "Complete?   Date      Temperature      Color       URL"
    puts "_________   #{date}   #{temperature}   #{color}    #{url}"
    puts "_________   #{date}   #{temperature}   #{color}    #{url}"
  end



end
