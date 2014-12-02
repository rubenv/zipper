var assert = require('assert');
var zipper = require('../build/Release/zipper');

function minorVersion(version) {
  return version.split('.').slice(0, 2).join('.');
}

/* assert ABI compatibility */
var zipperMinor = minorVersion(zipper.versions.node);
var nodeMinor = minorVersion(process.versions.node);
assert.ok(zipperMinor === nodeMinor, 'The running node version "' + nodeMinor + '.x" does not match the node version that zipper was compiled against: "' + zipperMinor + '.x"');

// push all C++ symbols into js module
for (var k in zipper) { exports[k] = zipper[k]; }
