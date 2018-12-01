const path = require('path');
const fs = require('fs');
const { execSync } = require('child_process');

exports.command = 'verify [pkg]';
exports.desc = 'Verify Cached Dependency';
exports.builder = {};
exports.handler = argv => execSync(
  fs.readFileSync(path.join(__dirname, '..', 'shell', 'verify.sh'), 'utf8')
    .replace('{{PACKAGE}}', (argv.pkg || '').toLowerCase()),
  { stdio: [0, 1, 2] }
);
