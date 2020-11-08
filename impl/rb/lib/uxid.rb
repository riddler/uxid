require "uxid/model"
require "uxid/encoder"
require "uxid/version"

module UXID
  CROCKFORD_ENCODING = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
  INVALID_REGEX = /[^#{CROCKFORD_ENCODING}]/
  TIME_MAX = 2.pow(48) - 1
  TIME_LEN = 10

  class Error < StandardError; end

  def self.encode
    Encoder.encode
  end
  
  def self.decode value
    case value
    when String then
      if value.strip.size == 0
        raise "input is required"

      elsif value =~ INVALID_REGEX
        raise "expected input to be a Base32 encoded string, got: '#{value}'"
      else
        UXID::Model.new value
      end
    else
      nil
    end
  end
end
