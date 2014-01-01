# DHLGM::Track

Track packages through the DHL Global Mail API.

## Installation

Add this line to your application's Gemfile:

    gem 'dhlgm-track'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dhlgm-track

## Rails Installation

Setup an initializer `config/initializers/dhlgm-track.rb' to configure the gem to use your DHL Global Mail API credentials.

    DHLGM.configure do |config|
      config.username = 'your_username'
      config.password = 'your_password'
    end

## Usage

   DHLGM::track('GM2951145570001572')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request