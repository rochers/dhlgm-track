module DHLGM
  class Configuration
    attr_accessor :password, :timeout, :username

    def initialize
      @timeout  = 5000
      @username = ENV['DHLGM_USERNAME']
      @password = ENV['DHLGM_PASSWORD']
    end
  end
end