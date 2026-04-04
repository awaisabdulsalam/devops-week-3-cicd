const { sum, subtract } = require("../src/math");

test("adds numbers correctly", () => {
  expect(sum(2, 3)).toBe(5);
});

test("subtracts numbers correctly", () => {
  expect(subtract(5, 3)).toBe(2);
});