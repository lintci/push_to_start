ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'sidekiq/testing'

Dir[Rails.root.join('spec/support/**/*.rb')].each{|f| require f}

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.infer_spec_type_from_file_location!

  config.before(:each) do
    Sidekiq::Worker.clear_all
  end
end
