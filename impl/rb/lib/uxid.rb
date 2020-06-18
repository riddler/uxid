require "uxid/version"

CROCKFORD_ENCODING = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
INVALID_REGEX = /[^#{CROCKFORD_ENCODING}]/

module UXID
  class Error < StandardError; end
  
  def self.decode value
    case value
    when String then
      if value.strip.size == 0
        raise "input is required"

      elsif value =~ INVALID_REGEX
        raise "expected input to be a Base32 encoded string, got: '#{value}'"
      end
    end
    "uxid"
  end
end
