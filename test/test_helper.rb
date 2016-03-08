ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require "minitest/rails/capybara"
require 'minitest-vcr'
require 'vcr'
require 'webmock'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all
  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
    config.allow_http_connections_when_no_cassette = true
  end
  MinitestVcr::Spec.configure!
end


class ActionDispatch::IntegrationTest
  include Capybara::DSL
end

class ActionController::TestCase
end
