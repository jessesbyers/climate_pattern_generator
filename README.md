# ClimatePatternGenerator

The Climate Pattern Generator was designed to automatically generate patterns for knitting or crocheting climate data.

Users input a zip code and a year, and the program scrapes the daily maximum temperature for that year, and converts that temperature to the corresponding color for representing that temperature in a fiber arts project.

Users can also view a more detailed daily weather summary for each day of the year after viewing the pattern.

See The Tempestry Project for examples and more details:
    https://www.tempestryproject.com

Weather data derived from the National Climatic Data Center, scraped via the Old Farmer's Almanac:              
    https://www.almanac.com/weather/history

Read more in my Blog Posts:
    To Scrape, or Not To Scrape: https://dev.to/jessesbyers/to-scrape-or-not-to-scrape-3cn8

    Climate Pattern Generator: Testing and Lessons Learned: https://dev.to/jessesbyers/climate-pattern-generator-testing-and-lessons-learned-5d0p



## Installation

Clone the repository and open it using your local IDE:
    $ git clone https://github.com/jessesbyers/climate_pattern_generator.git

Navigate into the application folder:
    $ cd climate_pattern_generator

Bundle Install
    $ bundle install

## Usage

NOTE: The full version of this apllication takes approximately 20 minutes to scrape a full year's worth of weather data.

Use the Demo Version (demo branch) to explore all features of the program with a smaller amount of data.
    $ git checkout demo

To run the program:
    $ ./bin/climate_pattern_generator

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'lucky-keyboard-3164'/climate_pattern_generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ClimatePatternGenerator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'lucky-keyboard-3164'/climate_pattern_generator/blob/master/CODE_OF_CONDUCT.md).