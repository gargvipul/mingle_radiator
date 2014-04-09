require 'rubygems'
require 'net/https'
require 'crack/xml'  
require 'api_auth'


# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
MingleRadiator::Application.initialize!

