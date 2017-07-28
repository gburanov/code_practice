ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def env(user, password)
    env = Hash.new
    env["CONTENT_TYPE"] = "application/json"
    env["ACCEPT"] = "application/json"
    env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{user}:#{password}")
    env
  end

  def admin_env
    env(users(:admin).login, users(:admin).password)
  end

  def guest_env
    env(users(:guest).login, users(:guest).password)
  end

  def user_env
    env(users(:user).login, users(:user).password)
  end

  def json_header
    { "CONTENT_TYPE": "application/json" }
  end
end
