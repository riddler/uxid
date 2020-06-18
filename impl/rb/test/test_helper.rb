$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "uxid"

require "minitest/autorun"
require "minitest/pride"
require "minitest/reporters"

default_reporter = Minitest::Reporters::DefaultReporter.new color: true
Minitest::Reporters.use! [default_reporter]
