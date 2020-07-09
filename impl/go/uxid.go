package uxid

import (
	"errors"
	"fmt"
	"math"
	"regexp"
	"strings"
)

const CrockfordAlphabet string = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
const InvalidRegexp string = "[^0123456789ABCDEFGHJKMNPQRSTVWXYZ]"

type UXID struct {
  encoded string
  time int
}

func Decode(input string) (id *UXID, err error) {
	if len(input) == 0 {
    return nil, errors.New("uxid: input is required")
  }

  matched, err := regexp.Match(InvalidRegexp, []byte(input))
  if (matched) {
    return nil, errors.New(fmt.Sprintf("uxid: expected input to be a Base32 encoded string, got: '%s'", input))
  }

  return &UXID{input, decodeTime(input)}, nil
}


func decodeTime(input string) int {
  decodedTime := 0
  for i := 9; i >= 0; i = i-1 {
    powerValue := int(math.Pow(32, float64(9-i)))
    char := string(input[i])
    alphabetIndex := strings.Index(CrockfordAlphabet, char)
    decodedTime += powerValue * alphabetIndex
  }

  return decodedTime
}
