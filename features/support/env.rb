require "aruba/cucumber"
require "busser/cucumber"

# aruba 2 dropped @aruba_timeout_seconds; setting it in a Before hook is a
# no-op, which quietly left these commands on aruba's 15 second default.
Aruba.configure do |config|
  config.exit_timeout = 60
end
