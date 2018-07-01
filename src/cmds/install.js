const path = require("path");
const fs = require("fs");
const { execSync } = require('child_process');

exports.command = 'install';
exports.desc = 'Installing Dependencies from Offline Cache';
exports.builder = {};
exports.handler = () => execSync(
  fs.readFileSync(path.join(__dirname, "..", "shell", "install.sh"), "utf8"),
  { stdio: [0, 1, 2] }
);
