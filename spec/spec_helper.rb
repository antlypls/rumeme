require 'rspec/collection_matchers'

lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift lib

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
else
  require 'simplecov'
  SimpleCov.start
end

require 'rumeme'
