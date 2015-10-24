require 'bundler/setup'
Bundler.setup

require 'byebug'
require 'roth_ira'

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end