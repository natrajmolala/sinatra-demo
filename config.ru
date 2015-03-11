__dir__ = File.dirname(__FILE__)
$LOAD_PATH.unshift("#{__dir__}/app")

require 'sinatraApp'

map '/assets' do
  puts 'calling for assets'
  run SinatraApp.assets
end

map '/pet-clinic' do
  run SinatraApp
end
