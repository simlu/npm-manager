const path = require("path");
const fs = require("fs");
const { execSync } = require('child_process');

exports.command = 'persist [pkg]';
exports.desc = 'Persist Currently Installed Dependency';
exports.builder = {};
exports.handler = argv => execSync(
  fs.readFileSync(path.join(__dirname, "..", "shell", "persist.sh"), "utf8")
    .replace("{{PACKAGE}}", (argv.pkg || "").toLowerCase()),
  { stdio: [0, 1, 2] }
);
