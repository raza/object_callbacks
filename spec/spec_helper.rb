require 'bundler/setup'
Bundler.setup

if RUBY_VERSION[/1.9/]
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

# RSpec.configure do |config|
# end
