# DHLGM Track Gem

[![Build Status](https://travis-ci.org/rochers/dhlgm-track.png?branch=master)](https://travis-ci.org/rochers/dhlgm-track) [![Code Climate](https://codeclimate.com/github/rochers/dhlgm-track.png)](https://codeclimate.com/github/rochers/dhlgm-track)

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
Tracking packages is easy. Once configured, simply call track and pass your tracking number.

    DHLGM::track('GMXXXXXXXXXXXXXXXX')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request