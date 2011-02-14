# Load the rails application
require File.expand_path('../application', __FILE__)
require "rubygems"
require "twitter" #http://rdoc.info/gems/twitter/1.1.2/Twitter
# Initialize the rails application
TwitterClient::Application.initialize!
