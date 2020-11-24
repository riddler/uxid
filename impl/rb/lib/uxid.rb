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

  SIZE_WARNING_MESSAGE = <<~EOM
    WARN: The UXID :size param is for Symbol T-Shirt sizes only.
          Please use the :size param with Symbols (:xs, :s, :m, :l, :xl, or :xsmall, :small, :medium, :large, :xlarge),
          or use the :rand_size param for specific size of random bytes.
  EOM

  class Error < StandardError; end

  def self.generate attrs = {}
    model = new attrs
    model.encode
  end

  def self.new attrs = {}
    model = ::UXID::Model.new

    model.time = attrs[:time] || Time.now
    model.prefix = attrs[:prefix] || ""

    if attrs[:rand_size]
      model.rand_size = attrs[:rand_size]
    else
      model.size = attrs[:size]
      case model.size
      when Integer
        puts SIZE_WARNING_MESSAGE
        model.rand_size = model.size

      when String
        puts SIZE_WARNING_MESSAGE
        model.rand_size = 10

      when :xs, :xsmall
        model.rand_size = 0

      when :s, :small
        model.rand_size = 2

      when :m, :medium
        model.rand_size = 5

      when :l, :large
        model.rand_size = 7

      else
        model.rand_size = 10
      end

    end

    model
  end
end
