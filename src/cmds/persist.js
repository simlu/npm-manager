const path = require("path");
const fs = require("fs");
const { execSync } = require('child_process');

exports.command = 'persist';
exports.desc = 'Persist Currently Installed Dependency';
exports.builder = {};
exports.handler = () => execSync(
  fs.readFileSync(path.join(__dirname, "..", "shell", "persist.sh"), "utf8"),
  { stdio: [0, 1, 2] }
);
