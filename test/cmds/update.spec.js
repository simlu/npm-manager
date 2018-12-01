const path = require('path');
const expect = require('chai').expect;
const update = require('../../src/cmds/update');


describe('Testing `update`', () => {
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
    expect(update.handler()).to.equal(null);
  });
});
