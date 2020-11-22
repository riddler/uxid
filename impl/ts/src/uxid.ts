class UXID {
  encoded: string
  prefix: string
  randSize: number
  randString: string
  time: number
  timeString: string

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

    let binString = this.timeString + this.randString

    if (this.prefix) {
      this.encoded = this.prefix + "_" + binString
    } else {
      this.encoded = binString
    }
  }

  encodeTime(): string {
    this.timeString = "tttttttttt"
    return this.timeString
  }

  encodeRand(): string {
    let randString = "rrrrrrrrrrrrrrrr"
    this.randString = randString.substr(0, this.randSize)
    return this.randString
  }
}

export default UXID
