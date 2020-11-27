const CrockfordEncoding = [
  "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F",
  "G", "H", "J", "K", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y", "Z"
]

class UXID {
  encoded: string
  prefix: string
  randSize: number
  randEncoded: string
  time: number
  timeEncoded: string

  static generate(prefix?: string, size?: string): string {
    let uxid = new UXID(prefix, size)
    return uxid.encoded
  }

  constructor(prefix?: string, size?: string) {
    this.prefix = prefix
    this.time = (new Date).valueOf()

    switch (size) {
      case "xs":
      case "xsmall":
        this.randSize = 0;
        break;

      case "s":
      case "small":
        this.randSize = 2;
        break;

      case "m":
      case "medium":
        this.randSize = 5;
        break;

      case "l":
      case "large":
        this.randSize = 7;
        break;

      default:
        this.randSize = 10;
    }

    this.encode()
  }

  encode(): void {
    this.encodeTime()
    this.encodeRand()

    let binEncoded = this.timeEncoded + this.randEncoded

    if (this.prefix) {
      this.encoded = this.prefix + "_" + binEncoded
    } else {
      this.encoded = binEncoded
    }
  }

  encodeTime(): void {
    let timeArray = new Uint8Array(6)
    let timeView = new DataView(timeArray.buffer, 0, 6)
    let timeChars = new Array(10)

    timeView.setUint16(0, (this.time / 4294967296.0) | 0);
    timeView.setUint32(2, this.time | 0);

    timeChars[0] = CrockfordEncoding[(timeArray[0]&224)>>5]
    timeChars[1] = CrockfordEncoding[timeArray[0]&31]
    timeChars[2] = CrockfordEncoding[(timeArray[1]&248)>>3]
    timeChars[3] = CrockfordEncoding[((timeArray[1]&7)<<2)|((timeArray[2]&192)>>6)]
    timeChars[4] = CrockfordEncoding[(timeArray[2]&62)>>1]
    timeChars[5] = CrockfordEncoding[((timeArray[2]&1)<<4)|((timeArray[3]&240)>>4)]
    timeChars[6] = CrockfordEncoding[((timeArray[3]&15)<<1)|((timeArray[4]&128)>>7)]
    timeChars[7] = CrockfordEncoding[(timeArray[4]&124)>>2]
    timeChars[8] = CrockfordEncoding[((timeArray[4]&3)<<3)|((timeArray[5]&224)>>5)]
    timeChars[9] = CrockfordEncoding[timeArray[5]&31]

    this.timeEncoded = timeChars.join("")
  }

  encodeRand(): string {
    let randEncoded = "rrrrrrrrrrrrrrrr"
    this.randEncoded = randEncoded
    return this.randEncoded
  }
}

export default UXID
