const path = require("path");
const fs = require("fs");
const { execSync } = require('child_process');

exports.command = 'update [pkg]';
exports.desc = 'Update local NPM Dependencies';
exports.builder = {};
exports.handler = () => execSync(
  fs.readFileSync(path.join(__dirname, "..", "shell", "update.sh"), "utf8"),
  { stdio: [0, 1, 2] }
);
