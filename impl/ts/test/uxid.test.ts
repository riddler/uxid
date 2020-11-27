"use strict";
import UXID from "../src/uxid"

test("UXID", () => {
  expect(UXID).not.toBeNull()
})

test("UXID.generate()", () => {
  const uxid = UXID.generate()

  expect(uxid).not.toBeNull()
  expect(uxid.length).toBe(26)
})

test("UXID.generate(\"cus\")", () => {
  const uxid = UXID.generate("cus")

  expect(uxid).not.toBeNull()
  expect(uxid.length).toBe(30)
})

/*
test("UXID.generate(\"cus\", \"xs\")", () => {
  const uxid = UXID.generate("cus", "xs")
  console.log(uxid)

  expect(uxid).not.toBeNull()
  expect(uxid.length).toBe(14)
})

test("UXID.generate(\"cus\", \"xl\")", () => {
  const uxid = UXID.generate("cus", "xl")
  console.log(uxid)

  expect(uxid).not.toBeNull()
  expect(uxid.length).toBe(30)
})
*/
