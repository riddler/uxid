// AUTOGENERATED FILE - DO NOT EDIT

import UXID from "../../src/uxid"


describe("0001 setup api: api", () => {


  test("UXID decode exists", () => {
    const result = UXID.decode("01E9VB3RWNAR89HSKMS84K9HCS");
    expect(result).toBeDefined()
  });

});


describe("0001 setup api: decoder", () => {

  test("returns a UXID with input", () => {
    const input_string = "01E9VB3RWNAR89HSKMS84K9HCS";

    const uxid = UXID.decode(input_string);
    expect(uxid).toBeInstanceOf(UXID)
    expect(uxid.encoded).toBe("01E9VB3RWNAR89HSKMS84K9HCS");


  });

  test("rejects blank strings", () => {
    const input_string = "";

    expect(() => {
      UXID.decode(input_string);
    }).toThrow("input is required")

  });

});
