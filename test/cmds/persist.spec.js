const path = require('path');
const expect = require('chai').expect;
const persist = require('../../src/cmds/persist');


describe('Testing `persist`', () => {
  let cwd;
  before(() => {
    cwd = process.cwd();
    process.chdir(path.join(__dirname, '..', 'mock'));
  });
  after(() => {
    cwd = process.cwd();
    process.chdir(cwd);
  });

  it('Testing Basic', () => {
    expect(persist.handler({
      pkg: undefined
    })).to.equal(null);
  });
});
