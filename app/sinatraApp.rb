require 'sinatra/base'
require 'sprockets'
require 'sprockets-helpers'
require_relative 'config/conf'
require 'mongo'

require_relative 'routes'

class SinatraApp < Sinatra::Base

  include Mongo

  puts "Root: #{File.dirname(__FILE__)}"
  set :root, File.dirname(__FILE__)
  set :views, "#{root}/views"
  set :public_folder => 'public'

  set :assets, Sprockets::Environment.new
  assets.append_path 'app/assets/stylesheets'
  assets.append_path 'app/assets/javascripts'
  assets.append_path 'app/assets/images'

  assets.append_path 'app/assets/bootstrap-3.3.4/css'
  assets.append_path 'app/assets/bootstrap-3.3.4/js'
  assets.append_path 'app/assets/bootstrap-3.3.4/fonts'

  configure do

    env = ENV['RACK_ENV'] || 'development'
    Conf.initialize env

  end

  if Conf.env != :test
    $mongo_client = MongoClient.new(Conf.mongodb[:host], Conf.mongodb[:port])
    $mongo_db = $mongo_client[Conf.mongodb[:db]]
  end


  Sprockets::Helpers.configure do |config|
    config.environment = assets
    config.prefix = '/assets'
    config.digest = true
  end

  helpers Sprockets::Helpers
end

