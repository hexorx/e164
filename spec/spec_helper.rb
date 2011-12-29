$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'bundler'
require 'e164'

Bundler.require(:default, :test) if defined?(Bundler)

RSpec.configure do |config|
  config.mock_with :rspec
end
