#coded along with Devin for Wave 1

require 'simplecov'
SimpleCov.start do
  add_filter 'test/'
  add_filter 'lib/slack.rb'
end

require 'httparty'
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'webmock/minitest'
require 'vcr'
require 'dotenv'

Dotenv.load


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

VCR.configure do |config|
  config.cassette_library_dir = "test/cassettes"
  config.hook_into :webmock
end

VCR.configure do |config|
  config.cassette_library_dir = "test/cassettes"
  config.hook_into :webmock
  config.default_cassette_options = {
    :record => :new_episodes,
    :match_requests_on => [:method, :uri, :body]
  }

  config.filter_sensitive_data("<SLACK_TOKEN>") do
    ENV['SLACK_TOKEN']
  end  

end
