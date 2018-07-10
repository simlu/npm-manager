const path = require("path");
const expect = require('chai').expect;
const verify = require("../../src/cmds/verify");


describe("Testing `verify`", () => {
  let cwd;
  before(() => {
    cwd = process.cwd();
    process.chdir(path.join(__dirname, "..", "mock"));
  });
  after(() => {
    cwd = process.cwd();
    process.chdir(cwd);
  });

  it("Testing Basic", () => {
    expect(verify.handler({
      pkg: undefined
    })).to.equal(null);
  });
});
