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
	tbytes := make([]byte, 6)

	tbytes[0] = byte(ms >> 40)
	tbytes[1] = byte(ms >> 32)
	tbytes[2] = byte(ms >> 24)
	tbytes[3] = byte(ms >> 16)
	tbytes[4] = byte(ms >> 8)
	tbytes[5] = byte(ms)

	// Now encode the bytes into a time string
	tstring := make([]byte, 10)
	tstring[0] = CrockfordEncoding[(tbytes[0]&224)>>5]
	tstring[1] = CrockfordEncoding[tbytes[0]&31]
	tstring[2] = CrockfordEncoding[(tbytes[1]&248)>>3]
	tstring[3] = CrockfordEncoding[((tbytes[1]&7)<<2)|((tbytes[2]&192)>>6)]
	tstring[4] = CrockfordEncoding[(tbytes[2]&62)>>1]
	tstring[5] = CrockfordEncoding[((tbytes[2]&1)<<4)|((tbytes[3]&240)>>4)]
	tstring[6] = CrockfordEncoding[((tbytes[3]&15)<<1)|((tbytes[4]&128)>>7)]
	tstring[7] = CrockfordEncoding[(tbytes[4]&124)>>2]
	tstring[8] = CrockfordEncoding[((tbytes[4]&3)<<3)|((tbytes[5]&224)>>5)]
	tstring[9] = CrockfordEncoding[tbytes[5]&31]

	return string(tstring[:])
}

func EncodeRand(rand_size int) string {
	if rand_size <= 0 {
		return ""
	}

	switch rand_size {
	case 1:
		return EncodeRand1()
	case 2:
		return EncodeRand2()
	case 3:
		return EncodeRand3()
	case 4:
		return EncodeRand4()
	case 5:
		return EncodeRand5()
	case 6:
		return EncodeRand6()
	case 7:
		return EncodeRand7()
	case 8:
		return EncodeRand8()
	case 9:
		return EncodeRand9()
	}

  return EncodeRand10()
}

func EncodeRand1() string {
	entropy := cryptorand.Reader

	// Populate the entropy bytes
	ebytes := make([]byte, 1)
	_, _ = io.ReadFull(entropy, ebytes[:])

	// Convert the bytes to a string using CrockfordEncoding
	estring := make([]byte, 2)
	estring[0] = CrockfordEncoding[(ebytes[0]&248)>>3]
	estring[1] = CrockfordEncoding[((ebytes[0] & 7) << 2)]
	return string(estring[:2])
}

func EncodeRand2() string {
	entropy := cryptorand.Reader

	// Populate the entropy bytes
	ebytes := make([]byte, 2)
	_, _ = io.ReadFull(entropy, ebytes[:])

	// Convert the bytes to a string using CrockfordEncoding
	estring := make([]byte, 4)
	estring[0] = CrockfordEncoding[(ebytes[0]&248)>>3]
	estring[1] = CrockfordEncoding[((ebytes[0]&7)<<2)|((ebytes[1]&192)>>6)]
	estring[2] = CrockfordEncoding[(ebytes[1]&62)>>1]
	estring[3] = CrockfordEncoding[((ebytes[1] & 1) << 4)]
	return string(estring[:])
}

func EncodeRand3() string {
	entropy := cryptorand.Reader

	// Populate the entropy bytes
	ebytes := make([]byte, 3)
	_, _ = io.ReadFull(entropy, ebytes[:])

	// Convert the bytes to a string using CrockfordEncoding
	estring := make([]byte, 5)
	estring[0] = CrockfordEncoding[(ebytes[0]&248)>>3]
	estring[1] = CrockfordEncoding[((ebytes[0]&7)<<2)|((ebytes[1]&192)>>6)]
	estring[2] = CrockfordEncoding[(ebytes[1]&62)>>1]
	estring[3] = CrockfordEncoding[((ebytes[1]&1)<<4)|((ebytes[2]&240)>>4)]
	estring[4] = CrockfordEncoding[((ebytes[2] & 15) << 1)]
	return string(estring[:])
}

func EncodeRand4() string {
	entropy := cryptorand.Reader

	// Populate the entropy bytes
	ebytes := make([]byte, 4)
	_, _ = io.ReadFull(entropy, ebytes[:])

	// Convert the bytes to a string using CrockfordEncoding
	estring := make([]byte, 7)
	estring[0] = CrockfordEncoding[(ebytes[0]&248)>>3]
	estring[1] = CrockfordEncoding[((ebytes[0]&7)<<2)|((ebytes[1]&192)>>6)]
	estring[2] = CrockfordEncoding[(ebytes[1]&62)>>1]
	estring[3] = CrockfordEncoding[((ebytes[1]&1)<<4)|((ebytes[2]&240)>>4)]
	estring[4] = CrockfordEncoding[((ebytes[2]&15)<<1)|((ebytes[3]&128)>>7)]
	estring[5] = CrockfordEncoding[(ebytes[3]&124)>>2]
	estring[6] = CrockfordEncoding[((ebytes[3] & 3) << 3)]
	return string(estring[:])
}

func EncodeRand5() string {
	entropy := cryptorand.Reader

	// Populate the entropy bytes
	ebytes := make([]byte, 5)
	_, _ = io.ReadFull(entropy, ebytes[:])

	// Convert the bytes to a string using CrockfordEncoding
	estring := make([]byte, 8)
	estring[0] = CrockfordEncoding[(ebytes[0]&248)>>3]
	estring[1] = CrockfordEncoding[((ebytes[0]&7)<<2)|((ebytes[1]&192)>>6)]
	estring[2] = CrockfordEncoding[(ebytes[1]&62)>>1]
	estring[3] = CrockfordEncoding[((ebytes[1]&1)<<4)|((ebytes[2]&240)>>4)]
	estring[4] = CrockfordEncoding[((ebytes[2]&15)<<1)|((ebytes[3]&128)>>7)]
	estring[5] = CrockfordEncoding[(ebytes[3]&124)>>2]
	estring[6] = CrockfordEncoding[((ebytes[3]&3)<<3)|((ebytes[4]&224)>>5)]
	estring[7] = CrockfordEncoding[ebytes[4]&31]
	return string(estring[:])
}

func EncodeRand6() string {
	entropy := cryptorand.Reader

	// Populate the entropy bytes
	ebytes := make([]byte, 6)
	_, _ = io.ReadFull(entropy, ebytes[:])

	// Convert the bytes to a string using CrockfordEncoding
	estring := make([]byte, 10)
	estring[0] = CrockfordEncoding[(ebytes[0]&248)>>3]
	estring[1] = CrockfordEncoding[((ebytes[0]&7)<<2)|((ebytes[1]&192)>>6)]
	estring[2] = CrockfordEncoding[(ebytes[1]&62)>>1]
	estring[3] = CrockfordEncoding[((ebytes[1]&1)<<4)|((ebytes[2]&240)>>4)]
	estring[4] = CrockfordEncoding[((ebytes[2]&15)<<1)|((ebytes[3]&128)>>7)]
	estring[5] = CrockfordEncoding[(ebytes[3]&124)>>2]
	estring[6] = CrockfordEncoding[((ebytes[3]&3)<<3)|((ebytes[4]&224)>>5)]
	estring[7] = CrockfordEncoding[ebytes[4]&31]
	estring[8] = CrockfordEncoding[(ebytes[5]&248)>>3]
	estring[9] = CrockfordEncoding[((ebytes[5] & 7) << 2)]
	return string(estring[:])
}

func EncodeRand7() string {
	entropy := cryptorand.Reader

	// Populate the entropy bytes
	ebytes := make([]byte, 7)
	_, _ = io.ReadFull(entropy, ebytes[:])

	// Convert the bytes to a string using CrockfordEncoding
	estring := make([]byte, 12)
	estring[0] = CrockfordEncoding[(ebytes[0]&248)>>3]
	estring[1] = CrockfordEncoding[((ebytes[0]&7)<<2)|((ebytes[1]&192)>>6)]
	estring[2] = CrockfordEncoding[(ebytes[1]&62)>>1]
	estring[3] = CrockfordEncoding[((ebytes[1]&1)<<4)|((ebytes[2]&240)>>4)]
	estring[4] = CrockfordEncoding[((ebytes[2]&15)<<1)|((ebytes[3]&128)>>7)]
	estring[5] = CrockfordEncoding[(ebytes[3]&124)>>2]
	estring[6] = CrockfordEncoding[((ebytes[3]&3)<<3)|((ebytes[4]&224)>>5)]
	estring[7] = CrockfordEncoding[ebytes[4]&31]
	estring[8] = CrockfordEncoding[(ebytes[5]&248)>>3]
	estring[9] = CrockfordEncoding[((ebytes[5]&7)<<2)|((ebytes[6]&192)>>6)]
	estring[10] = CrockfordEncoding[(ebytes[6]&62)>>1]
	estring[11] = CrockfordEncoding[((ebytes[6] & 1) << 4)]
	return string(estring[:])
}

func EncodeRand8() string {
	entropy := cryptorand.Reader

	// Populate the entropy bytes
	ebytes := make([]byte, 8)
	_, _ = io.ReadFull(entropy, ebytes[:])

	// Convert the bytes to a string using CrockfordEncoding
	estring := make([]byte, 13)
	estring[0] = CrockfordEncoding[(ebytes[0]&248)>>3]
	estring[1] = CrockfordEncoding[((ebytes[0]&7)<<2)|((ebytes[1]&192)>>6)]
	estring[2] = CrockfordEncoding[(ebytes[1]&62)>>1]
	estring[3] = CrockfordEncoding[((ebytes[1]&1)<<4)|((ebytes[2]&240)>>4)]
	estring[4] = CrockfordEncoding[((ebytes[2]&15)<<1)|((ebytes[3]&128)>>7)]
	estring[5] = CrockfordEncoding[(ebytes[3]&124)>>2]
	estring[6] = CrockfordEncoding[((ebytes[3]&3)<<3)|((ebytes[4]&224)>>5)]
	estring[7] = CrockfordEncoding[ebytes[4]&31]
	estring[8] = CrockfordEncoding[(ebytes[5]&248)>>3]
	estring[9] = CrockfordEncoding[((ebytes[5]&7)<<2)|((ebytes[6]&192)>>6)]
	estring[10] = CrockfordEncoding[(ebytes[6]&62)>>1]
	estring[11] = CrockfordEncoding[((ebytes[6]&1)<<4)|((ebytes[7]&240)>>4)]
	estring[12] = CrockfordEncoding[((ebytes[7] & 15) << 1)]
	return string(estring[:])
}

func EncodeRand9() string {
	entropy := cryptorand.Reader

	// Populate the entropy bytes
	ebytes := make([]byte, 9)
	_, _ = io.ReadFull(entropy, ebytes[:])

	// Convert the bytes to a string using CrockfordEncoding
	estring := make([]byte, 15)
	estring[0] = CrockfordEncoding[(ebytes[0]&248)>>3]
	estring[1] = CrockfordEncoding[((ebytes[0]&7)<<2)|((ebytes[1]&192)>>6)]
	estring[2] = CrockfordEncoding[(ebytes[1]&62)>>1]
	estring[3] = CrockfordEncoding[((ebytes[1]&1)<<4)|((ebytes[2]&240)>>4)]
	estring[4] = CrockfordEncoding[((ebytes[2]&15)<<1)|((ebytes[3]&128)>>7)]
	estring[5] = CrockfordEncoding[(ebytes[3]&124)>>2]
	estring[6] = CrockfordEncoding[((ebytes[3]&3)<<3)|((ebytes[4]&224)>>5)]
	estring[7] = CrockfordEncoding[ebytes[4]&31]
	estring[8] = CrockfordEncoding[(ebytes[5]&248)>>3]
	estring[9] = CrockfordEncoding[((ebytes[5]&7)<<2)|((ebytes[6]&192)>>6)]
	estring[10] = CrockfordEncoding[(ebytes[6]&62)>>1]
	estring[11] = CrockfordEncoding[((ebytes[6]&1)<<4)|((ebytes[7]&240)>>4)]
	estring[12] = CrockfordEncoding[((ebytes[7]&15)<<1)|((ebytes[8]&128)>>7)]
	estring[13] = CrockfordEncoding[(ebytes[8]&124)>>2]
	estring[14] = CrockfordEncoding[((ebytes[8] & 3) << 3)]
	return string(estring[:])
}

func EncodeRand10() string {
	entropy := cryptorand.Reader

	// Populate the entropy bytes
	ebytes := make([]byte, 10)
	_, _ = io.ReadFull(entropy, ebytes[:])

	// Convert the bytes to a string using CrockfordEncoding
	estring := make([]byte, 16)
	estring[0] = CrockfordEncoding[(ebytes[0]&248)>>3]
	estring[1] = CrockfordEncoding[((ebytes[0]&7)<<2)|((ebytes[1]&192)>>6)]
	estring[2] = CrockfordEncoding[(ebytes[1]&62)>>1]
	estring[3] = CrockfordEncoding[((ebytes[1]&1)<<4)|((ebytes[2]&240)>>4)]
	estring[4] = CrockfordEncoding[((ebytes[2]&15)<<1)|((ebytes[3]&128)>>7)]
	estring[5] = CrockfordEncoding[(ebytes[3]&124)>>2]
	estring[6] = CrockfordEncoding[((ebytes[3]&3)<<3)|((ebytes[4]&224)>>5)]
	estring[7] = CrockfordEncoding[ebytes[4]&31]
	estring[8] = CrockfordEncoding[(ebytes[5]&248)>>3]
	estring[9] = CrockfordEncoding[((ebytes[5]&7)<<2)|((ebytes[6]&192)>>6)]
	estring[10] = CrockfordEncoding[(ebytes[6]&62)>>1]
	estring[11] = CrockfordEncoding[((ebytes[6]&1)<<4)|((ebytes[7]&240)>>4)]
	estring[12] = CrockfordEncoding[((ebytes[7]&15)<<1)|((ebytes[8]&128)>>7)]
	estring[13] = CrockfordEncoding[(ebytes[8]&124)>>2]
	estring[14] = CrockfordEncoding[((ebytes[8]&3)<<3)|((ebytes[9]&224)>>5)]
	estring[15] = CrockfordEncoding[ebytes[9]&31]

	return string(estring[:])
}

func Timestamp(t time.Time) uint64 {
	return uint64(t.Unix())*1000 +
		uint64(t.Nanosecond()/int(time.Millisecond))
}
