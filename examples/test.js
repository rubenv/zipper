zipper = require('../lib/').Zipper;

var zipfile = new zipper('zipfile.zip');
zipfile.addFile(__dirname + '/../README.md', 'README.txt', function (err) {
    if (err) throw err;
    // Do stuff
});
