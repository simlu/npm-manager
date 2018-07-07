const path = require("path");
const fs = require("fs");
const { execSync } = require('child_process');

exports.command = 'install [pkg]';
exports.desc = 'Installing Dependencies from Offline Cache';
exports.builder = {};
exports.handler = argv => execSync(
  fs.readFileSync(path.join(__dirname, "..", "shell", "install.sh"), "utf8").replace("{{PACKAGE}}", argv.pkg || ""),
  { stdio: [0, 1, 2] }
);
