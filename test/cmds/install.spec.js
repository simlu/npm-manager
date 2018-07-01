const path = require("path");
const expect = require('chai').expect;
const install = require("../../src/cmds/install");


describe("Testing `install`", () => {
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
    expect(install.handler()).to.equal(null);
  });
});
