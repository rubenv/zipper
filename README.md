  Insanely simple zipfile creator for node.js.

  Developed by Flow Pilots: http://www.flowpilots.com/

# Usage

    zipper = require('zipper').Zipper;

    var zipfile = new zipper('/path/to/my/zipfile.zip');
    zipfile.addFile('myfile.txt', '/path/to/myfile.txt', function (err) {
        if (err) throw err;
        // Do stuff
    });

### Or to add Multiple files in one call

    var files = {
      'path/to/file/spo.txt':'name_in_zip.txt',
      'path/to/file/car.txt':'name_in_zip/car.txt'
    }

    zipfiles.addFile(files, function (err) {
        if (err) throw err;
        // Do stuff
    });


  The zip file will be created if it does not exist already. If the file already exists in the zip a warning will be throwen and call will fail.

## Installation

  You can install the latest tag via npm:
  
    $ npm install zipper
  
  Or install from github master:
  
    $ git clone git://github.com/rubenv/zipper.git
    $ cd zipper
    $ ./configure
    $ make
    $ make install

## TODO

  Integrate back into node-zipfile. This was not done in the first place as we
  needed a fix fast.

## Credits

  Inspired by node-zipfile (written by Dane Springmeyer).
