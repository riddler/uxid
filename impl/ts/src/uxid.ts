const CROCKFORD_ENCODING = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
const INVALID_REGEX = new RegExp(`[^${CROCKFORD_ENCODING}]`)
const TIME_MAX = Math.pow(2, 48) - 1
const TIME_LEN = 10

class UXID {
  encoded: string;
  time: number;

  static decode(encoded: string): UXID {
    if (!encoded || encoded === "") {
      throw "input is required"
    }

    if (encoded.match(INVALID_REGEX)) {
      throw `expected input to be a Base32 encoded string, got: '${encoded}'`
    }

    let uxid = new UXID(encoded)
    uxid.decode()
    return uxid
  }

  static generate(): string {
    return "UXID"
  }

  constructor(encoded?: string, time?: number) {
    this.encoded = encoded
    this.time = time
  }

  decode(): void {
    this.decodeTime()
  }

  decodeTime(): void {
    this.time = this.encoded
      .substr(0, TIME_LEN)
      .split("")
      .reverse()
      .reduce((carry, char, index) => {
        return (carry += CROCKFORD_ENCODING.indexOf(char) * Math.pow(32, index))
      }, 0)
  }
}

export default UXID
