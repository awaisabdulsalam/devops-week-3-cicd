const sum = require("./index");

if (sum(2, 3) !== 6) {
  throw new Error("Test failed ❌");
}

console.log("Test passed ✅");
