module UXID
  module Crockford
    ALPHABET = "0123456789ABCDEFGHJKMNPQRSTVWXYZ".freeze

    class Chunk
      def initialize bytes
        @bytes = bytes
      end

      def decode
        bytes = @bytes.take_while {|c| c != 61} # strip padding
        n = (bytes.length * 5.0 / 8.0).floor
        p = bytes.length < 8 ? 5 - (n * 8) % 5 : 0
        c = bytes.inject(0) do |m,o|
          i = ALPHABET.index o.chr
          raise ArgumentError, "invalid character '#{o.chr}'" if i.nil?
          (m << 5) + i
        end >> p
        (0..n-1).to_a.reverse.collect {|i| ((c >> i * 8) & 0xff).chr}
      end

      def encode
        n = (@bytes.length * 8.0 / 5.0).ceil
        p = n < 8 ? 5 - (@bytes.length * 8) % 5 : 0
        c = @bytes.inject(0) {|m,o| (m << 8) + o} << p
        [(0..n-1).to_a.reverse.collect {|i| ALPHABET[(c >> i * 5) & 0x1f].chr}]
      end
    end

    def self.chunks str, size
      result = []
      bytes = str.bytes
      while bytes.any? do
        chunk_bytes = bytes.take size
        bytes = bytes.drop size
        new_chunk = Chunk.new chunk_bytes
        result << new_chunk
      end
      result
    end

    def self.encode str
      chunks(str, 5).collect(&:encode).flatten.join
    end

    def self.decode str
      chunks(str, 8).collect(&:decode).flatten.join
    end
  end
end
