package uxid

import (
	cryptorand "crypto/rand"
	"io"
	"time"
)

const CrockfordEncoding string = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"

func Generate(prefix string, rand_size int) (id_str string, err error) {
	time_string := EncodeTime(time.Now().UTC())
	rand_string := EncodeRand(rand_size)

	if "" == prefix {
		return time_string + rand_string, nil
	}

	return prefix + "_" + time_string + rand_string, nil
}

func EncodeTime(t time.Time) string {
	ms := Timestamp(t)

	// Create the time bytes to store timestamp
	tb := make([]byte, 6)

	tb[0] = byte(ms >> 40)
	tb[1] = byte(ms >> 32)
	tb[2] = byte(ms >> 24)
	tb[3] = byte(ms >> 16)
	tb[4] = byte(ms >> 8)
	tb[5] = byte(ms)

	// Now encode the bytes into a time string
	ts := make([]byte, 10)
	ts[0] = CrockfordEncoding[(tb[0]&224)>>5]
	ts[1] = CrockfordEncoding[tb[0]&31]
	ts[2] = CrockfordEncoding[(tb[1]&248)>>3]
	ts[3] = CrockfordEncoding[((tb[1]&7)<<2)|((tb[2]&192)>>6)]
	ts[4] = CrockfordEncoding[(tb[2]&62)>>1]
	ts[5] = CrockfordEncoding[((tb[2]&1)<<4)|((tb[3]&240)>>4)]
	ts[6] = CrockfordEncoding[((tb[3]&15)<<1)|((tb[4]&128)>>7)]
	ts[7] = CrockfordEncoding[(tb[4]&124)>>2]
	ts[8] = CrockfordEncoding[((tb[4]&3)<<3)|((tb[5]&224)>>5)]
	ts[9] = CrockfordEncoding[tb[5]&31]

	return string(ts[:])
}

func EncodeRand(rand_size int) string {
	if rand_size <= 0 {
		return ""
	} else if rand_size > 10 {
		rand_size = 10
	}

	entropy := cryptorand.Reader

	// 16 possible characters
	es := make([]byte, 16)

	// Generate and store the entropy bytes
	eb := make([]byte, rand_size)
	_, _ = io.ReadFull(entropy, eb[:])

	es[0] = CrockfordEncoding[(eb[0]&248)>>3]

	if rand_size == 1 {
		es[1] = CrockfordEncoding[((eb[0] & 7) << 2)]
		return string(es[:2])
	}

	es[1] = CrockfordEncoding[((eb[0]&7)<<2)|((eb[1]&192)>>6)]
	es[2] = CrockfordEncoding[(eb[1]&62)>>1]

	if rand_size == 2 {
		es[3] = CrockfordEncoding[((eb[1] & 1) << 4)]
		return string(es[:4])
	}

	es[3] = CrockfordEncoding[((eb[1]&1)<<4)|((eb[2]&240)>>4)]

	if rand_size == 3 {
		es[4] = CrockfordEncoding[((eb[2] & 15) << 1)]
		return string(es[:5])
	}

	es[4] = CrockfordEncoding[((eb[2]&15)<<1)|((eb[3]&128)>>7)]
	es[5] = CrockfordEncoding[(eb[3]&124)>>2]

	if rand_size == 4 {
		es[6] = CrockfordEncoding[((eb[3] & 3) << 3)]
		return string(es[:7])
	}

	es[6] = CrockfordEncoding[((eb[3]&3)<<3)|((eb[4]&224)>>5)]
	es[7] = CrockfordEncoding[eb[4]&31]

	if rand_size == 5 {
		return string(es[:8])
	}

	es[8] = CrockfordEncoding[(eb[5]&248)>>3]

	if rand_size == 6 {
		es[9] = CrockfordEncoding[((eb[5] & 7) << 2)]
		return string(es[:10])
	}

	es[9] = CrockfordEncoding[((eb[5]&7)<<2)|((eb[6]&192)>>6)]
	es[10] = CrockfordEncoding[(eb[6]&62)>>1]

	if rand_size == 7 {
		es[11] = CrockfordEncoding[((eb[6] & 1) << 4)]
		return string(es[:12])
	}

	es[11] = CrockfordEncoding[((eb[6]&1)<<4)|((eb[7]&240)>>4)]

	if rand_size == 8 {
		es[12] = CrockfordEncoding[((eb[7] & 15) << 1)]
		return string(es[:13])
	}

	es[12] = CrockfordEncoding[((eb[7]&15)<<1)|((eb[8]&128)>>7)]
	es[13] = CrockfordEncoding[(eb[8]&124)>>2]

	if rand_size == 9 {
		es[14] = CrockfordEncoding[((eb[8] & 3) << 3)]
		return string(es[:3])
	}

	es[14] = CrockfordEncoding[((eb[8]&3)<<3)|((eb[9]&224)>>5)]
	es[15] = CrockfordEncoding[eb[9]&31]

	return string(es[:])
}

// Timestamp converts a time.Time to Unix milliseconds.
//
// Because of the way ULID stores time, times from the year
// 10889 produces undefined results.
func Timestamp(t time.Time) uint64 {
	return uint64(t.Unix())*1000 +
		uint64(t.Nanosecond()/int(time.Millisecond))
}
