# frozen-string-literal: true

if RUBY_VERSION >= "2.5"
  require "securerandom"
else
  require "sysrandom/securerandom"
end


module UXID
  class Model
    attr_accessor :time, :time_encoded, :entropy, :entropy_encoded, :prefix, :size

    # Returns time as 48 bits
    def time_bytes
      return @time_bytes if @time_bytes

      time_ms = (@time.to_f * 1000).to_i
      bytes = [time_ms].pack "Q>"
      bytes_string = bytes[2..-1]
      @time_bytes = bytes_string.bytes
    end

    def entropy_bytes
      return @entropy_bytes if @entropy_bytes

      bytes_string = SecureRandom.random_bytes @size
      @entropy_bytes = bytes_string.bytes
      return @entropy_bytes
    end

    def encoded
      time_encoded + entropy_encoded
    end

    # def initialize value
    #   @encoded = value
    #   decode_time
    # end

    # def decode_time
    #   time_chars = @encoded[0...::UXID::TIME_LEN].split ""
    #   reversed_chars_with_index = time_chars.reverse.each_with_index

    #   @time = reversed_chars_with_index.reduce(0) do |acc, (char, power_index)|
    #     power_value = 32.pow power_index
    #     alphabet_index = ::UXID::CROCKFORD_ENCODING.index char
    #     acc += power_value * alphabet_index
    #   end
    # end
  end
end
