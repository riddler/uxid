module UXID
  class Model
    attr_reader :encoded, :time

    def initialize value
      @encoded = value
      decode_time
    end

    def decode_time
      time_chars = @encoded[0...::UXID::TIME_LEN].split ""
      reversed_chars_with_index = time_chars.reverse.each_with_index

      @time = reversed_chars_with_index.reduce(0) do |acc, (char, power_index)|
        power_value = 32.pow power_index
        alphabet_index = ::UXID::CROCKFORD_ENCODING.index char
        acc += power_value * alphabet_index
      end
    end
  end
end
