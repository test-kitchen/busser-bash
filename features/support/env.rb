require "aruba/cucumber"
require "busser/cucumber"

if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.command_name "features"
  SimpleCov.start do
    add_filter "/features/"
    add_group "Libraries", "/lib/"
  end
end

# aruba 2 dropped @aruba_timeout_seconds; setting it in a Before hook is a
# no-op, which quietly left these commands on aruba's 15 second default.
Aruba.configure do |config|
  config.exit_timeout = 60
end
