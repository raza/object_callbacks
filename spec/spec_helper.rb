require 'bundler/setup'
Bundler.setup

if RUBY_VERSION == '1.9.3'
  require 'pry'
  if ENV['CODECLIMATE_REPO_TOKEN']
    require 'codeclimate-test-reporter'
    CodeClimate::TestReporter.start
  end
end
