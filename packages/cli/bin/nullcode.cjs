#!/usr/bin/env node
// NullCode: thin shim over the opencode CLI loader. Keeps the binary name
// "nullcode" on PATH, forwards to the normal cached launcher.
require("./opencode.cjs")
