module UXID
  class Encoder
    def self.encode model
      new(model).encode
    end

    def initialize model
      @model = model
    end

    def encode
      @model.time_encoded = encode_time
      @model.entropy_encoded = public_send "encode_entropy_#{@model.rand_size}"

      @model.encoded
    end

    def encode_entropy_0; ""; end

    def encode_entropy_1
      b0, _b1 = @model.entropy_bytes

      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)]
    end

    def encode_entropy_2
      b0, b1 = @model.entropy_bytes

      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)] +
      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)  | ((b1&192)>>6)] +
      UXID::CROCKFORD_ENCODING[(b1&62)>>1] +
      UXID::CROCKFORD_ENCODING[((b1&1)<<4)]
    end

    def encode_entropy_3
      b0, b1, b2 = @model.entropy_bytes

      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)] +
      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)  | ((b1&192)>>6)] +
      UXID::CROCKFORD_ENCODING[(b1&62)>>1] +
      UXID::CROCKFORD_ENCODING[((b1&1)<<4)  | ((b2&240)>>4)] +
      UXID::CROCKFORD_ENCODING[((b2&15)<<1)]
    end

    def encode_entropy_4
      b0, b1, b2, b3 = @model.entropy_bytes

      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)] +
      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)  | ((b1&192)>>6)] +
      UXID::CROCKFORD_ENCODING[(b1&62)>>1] +
      UXID::CROCKFORD_ENCODING[((b1&1)<<4)  | ((b2&240)>>4)] +
      UXID::CROCKFORD_ENCODING[((b2&15)<<1) | ((b3&128)>>7)] +
      UXID::CROCKFORD_ENCODING[(b3&124)>>2] +
      UXID::CROCKFORD_ENCODING[((b3&3)<<3)]
    end

    def encode_entropy_5
      b0, b1, b2, b3, b4 = @model.entropy_bytes

      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)] +
      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)  | ((b1&192)>>6)] +
      UXID::CROCKFORD_ENCODING[(b1&62)>>1] +
      UXID::CROCKFORD_ENCODING[((b1&1)<<4)  | ((b2&240)>>4)] +
      UXID::CROCKFORD_ENCODING[((b2&15)<<1) | ((b3&128)>>7)] +
      UXID::CROCKFORD_ENCODING[(b3&124)>>2] +
      UXID::CROCKFORD_ENCODING[((b3&3)<<3)  | ((b4&224)>>5)] +
      UXID::CROCKFORD_ENCODING[b4&31]
    end

    def encode_entropy_6
      b0, b1, b2, b3, b4, b5 = @model.entropy_bytes

      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)] +
      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)  | ((b1&192)>>6)] +
      UXID::CROCKFORD_ENCODING[(b1&62)>>1] +
      UXID::CROCKFORD_ENCODING[((b1&1)<<4)  | ((b2&240)>>4)] +
      UXID::CROCKFORD_ENCODING[((b2&15)<<1) | ((b3&128)>>7)] +
      UXID::CROCKFORD_ENCODING[(b3&124)>>2] +
      UXID::CROCKFORD_ENCODING[((b3&3)<<3)  | ((b4&224)>>5)] +
      UXID::CROCKFORD_ENCODING[b4&31] +
      UXID::CROCKFORD_ENCODING[(b5&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b5&7)<<2)]
    end

    def encode_entropy_7
      b0, b1, b2, b3, b4, b5, b6 = @model.entropy_bytes

      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)] +
      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)  | ((b1&192)>>6)] +
      UXID::CROCKFORD_ENCODING[(b1&62)>>1] +
      UXID::CROCKFORD_ENCODING[((b1&1)<<4)  | ((b2&240)>>4)] +
      UXID::CROCKFORD_ENCODING[((b2&15)<<1) | ((b3&128)>>7)] +
      UXID::CROCKFORD_ENCODING[(b3&124)>>2] +
      UXID::CROCKFORD_ENCODING[((b3&3)<<3)  | ((b4&224)>>5)] +
      UXID::CROCKFORD_ENCODING[b4&31] +
      UXID::CROCKFORD_ENCODING[(b5&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b5&7)<<2)  | ((b6&192)>>6)] +
      UXID::CROCKFORD_ENCODING[(b6&62)>>1] +
      UXID::CROCKFORD_ENCODING[((b6&1)<<4)]
    end

    def encode_entropy_8
      b0, b1, b2, b3, b4, b5, b6, b7 = @model.entropy_bytes

      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)] +
      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)  | ((b1&192)>>6)] +
      UXID::CROCKFORD_ENCODING[(b1&62)>>1] +
      UXID::CROCKFORD_ENCODING[((b1&1)<<4)  | ((b2&240)>>4)] +
      UXID::CROCKFORD_ENCODING[((b2&15)<<1) | ((b3&128)>>7)] +
      UXID::CROCKFORD_ENCODING[(b3&124)>>2] +
      UXID::CROCKFORD_ENCODING[((b3&3)<<3)  | ((b4&224)>>5)] +
      UXID::CROCKFORD_ENCODING[b4&31] +
      UXID::CROCKFORD_ENCODING[(b5&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b5&7)<<2)  | ((b6&192)>>6)] +
      UXID::CROCKFORD_ENCODING[(b6&62)>>1] +
      UXID::CROCKFORD_ENCODING[((b6&1)<<4)  | ((b7&240)>>4)] +
      UXID::CROCKFORD_ENCODING[((b7&15)<<1)]
    end

    def encode_entropy_9
      b0, b1, b2, b3, b4, b5, b6, b7, b8 = @model.entropy_bytes

      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)] +
      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)  | ((b1&192)>>6)] +
      UXID::CROCKFORD_ENCODING[(b1&62)>>1] +
      UXID::CROCKFORD_ENCODING[((b1&1)<<4)  | ((b2&240)>>4)] +
      UXID::CROCKFORD_ENCODING[((b2&15)<<1) | ((b3&128)>>7)] +
      UXID::CROCKFORD_ENCODING[(b3&124)>>2] +
      UXID::CROCKFORD_ENCODING[((b3&3)<<3)  | ((b4&224)>>5)] +
      UXID::CROCKFORD_ENCODING[b4&31] +
      UXID::CROCKFORD_ENCODING[(b5&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b5&7)<<2)  | ((b6&192)>>6)] +
      UXID::CROCKFORD_ENCODING[(b6&62)>>1] +
      UXID::CROCKFORD_ENCODING[((b6&1)<<4)  | ((b7&240)>>4)] +
      UXID::CROCKFORD_ENCODING[((b7&15)<<1)] +
      UXID::CROCKFORD_ENCODING[((b7&15)<<1) | ((b8&128)>>7)] +
      UXID::CROCKFORD_ENCODING[(b8&124)>>2] +
      UXID::CROCKFORD_ENCODING[((b8&3)<<3)]
    end

    def encode_entropy_10
      b0, b1, b2, b3, b4, b5, b6, b7, b8, b9 = @model.entropy_bytes

      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)] +
      UXID::CROCKFORD_ENCODING[(b0&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b0&7)<<2)  | ((b1&192)>>6)] +
      UXID::CROCKFORD_ENCODING[(b1&62)>>1] +
      UXID::CROCKFORD_ENCODING[((b1&1)<<4)  | ((b2&240)>>4)] +
      UXID::CROCKFORD_ENCODING[((b2&15)<<1) | ((b3&128)>>7)] +
      UXID::CROCKFORD_ENCODING[(b3&124)>>2] +
      UXID::CROCKFORD_ENCODING[((b3&3)<<3)  | ((b4&224)>>5)] +
      UXID::CROCKFORD_ENCODING[b4&31] +
      UXID::CROCKFORD_ENCODING[(b5&248)>>3] +
      UXID::CROCKFORD_ENCODING[((b5&7)<<2)  | ((b6&192)>>6)] +
      UXID::CROCKFORD_ENCODING[(b6&62)>>1] +
      UXID::CROCKFORD_ENCODING[((b6&1)<<4)  | ((b7&240)>>4)] +
      UXID::CROCKFORD_ENCODING[((b7&15)<<1)] +
      UXID::CROCKFORD_ENCODING[((b7&15)<<1) | ((b8&128)>>7)] +
      UXID::CROCKFORD_ENCODING[(b8&124)>>2] +
      UXID::CROCKFORD_ENCODING[((b8&3)<<3)  | ((b9&224)>>5)] +
      UXID::CROCKFORD_ENCODING[b9&31]
    end

    def encode_time
      # Get the 5 bytes of the 48bit time
      b0, b1, b2, b3, b4, b5 = @model.time_bytes

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
  end
end
