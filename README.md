  Insanely simple zipfile creator for node.js.

  [![Build Status](https://travis-ci.org/rubenv/zipper.png?branch=master)](https://travis-ci.org/rubenv/zipper)

  Developed by Flow Pilots: http://www.flowpilots.com/

# Usage

    zipper = require('zipper').Zipper;

    var zipfile = new zipper('/path/to/my/zipfile.zip');
    zipfile.addFile('myfile.txt', '/path/to/myfile.txt', function (err) {
        if (err) throw err;
        // Do stuff
    });

  The zip file will be created if it does not exist already.

## Installation

  You can install the latest tag via npm:
  
    $ npm install zipper

  Be sure to install `libzip-devel` (Fedora etc.) or `libzip-dev` (Ubuntu etc.)
  before installing on Linux.

## Credits

  Inspired by node-zipfile (written by Dane Springmeyer).
