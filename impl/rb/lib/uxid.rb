# frozen-string-literal: true

if RUBY_VERSION >= "2.5"
  require "securerandom"
else
  require "sysrandom/securerandom"
end

require "uxid/model"
require "uxid/encoder"
require "uxid/version"

module UXID
  CROCKFORD_ENCODING = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
  DELIMITER = "_"

  class Error < StandardError; end

  def self.generate attrs = {}
    model = new attrs
    model.encode
  end

  def self.new attrs = {}
    model = ::UXID::Model.new

    model.time = attrs[:time] || Time.now
    model.size = attrs[:size] || 10
    model.prefix = attrs[:prefix] || ""

    model
  end
end
