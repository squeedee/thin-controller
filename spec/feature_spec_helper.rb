require 'spec_helper'
require 'simple_bdd'


ENV['RAILS_ENV'] ||= 'test'

Bundler.require(:development)

require File.expand_path('../dummy/config/environment.rb', __FILE__)

require 'rspec/rails'
require 'rspec/autorun'
require 'database_cleaner'

RSpec.configure do |config|
  config.include SimpleBdd
  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
