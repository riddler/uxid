module UXID
  class Encoder
    def self.encode
      new.encode
    end

    def initialize
      @time = Time.now
    end

    def encode
      encode_time
    end

    def encode_time
      enc = ""

      # Get the 5 bytes of the 48bit time
      b0, b1, b2, b3, b4, b5 = time_bytes[0..5]

      # Split these 5 bytes up into 10 characters using the encoding
      # and join them together as a string
      UXID::CROCKFORD_ENCODING[(b0&224)>>5] +
      UXID::CROCKFORD_ENCODING[b0&31] +
      UXID::CROCKFORD_ENCODING[(b1&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b1&7)<<2)  | ((b2&192)>>6)] +
      UXID::CROCKFORD_ENCODING[(b2&62)>>1] +
      UXID::CROCKFORD_ENCODING[((b2&1)<<4)  | ((b3&240)>>4)] +
      UXID::CROCKFORD_ENCODING[((b3&15)<<1) | ((b4&128)>>7)] +
      UXID::CROCKFORD_ENCODING[(b4&124)>>2] +
      UXID::CROCKFORD_ENCODING[((b4&3)<<3)  | ((b5&224)>>5)] +
      UXID::CROCKFORD_ENCODING[b5&31]
    end

    # Returns time as 48 bits
    def time_bytes
      time_ms = (@time.to_f * 1000).to_i
      time_bytes = [time_ms].pack("Q>")
      time_bytes[2..-1].bytes
    end
  end
end
