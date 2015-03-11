require 'sinatra/base'
require 'sprockets'
require 'sprockets-helpers'

require_relative 'routes'

class SinatraApp < Sinatra::Base
  puts "Root: #{File.dirname(__FILE__)}"
  set :root, File.dirname(__FILE__)
  set :views, "#{root}/views"
  set :public_folder => 'public'

  set :assets, Sprockets::Environment.new
  assets.append_path 'app/assets/stylesheets'
  assets.append_path 'app/assets/javascripts'
  assets.append_path 'app/assets/images'

  Sprockets::Helpers.configure do |config|
    config.environment = assets
    config.prefix = '/assets'
    config.digest = true
  end

  helpers Sprockets::Helpers
end

