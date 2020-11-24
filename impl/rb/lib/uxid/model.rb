require "uxid/encoder"

module UXID
  class Model
    attr_accessor :time, :time_encoded, :entropy, :entropy_encoded, :prefix, :size, :rand_size

    def encode
      encoder = ::UXID::Encoder.new self
      encoder.encode
    end

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

      bytes_string = SecureRandom.random_bytes @rand_size
      @entropy_bytes = bytes_string.bytes
      return @entropy_bytes
    end

    def encoded
      id = time_encoded + entropy_encoded

      if has_prefix?
        [prefix, id].join UXID::DELIMITER
      else
        id
      end
    end

    def has_prefix?
      !(prefix.nil? || prefix == "")
    end
  end
end
