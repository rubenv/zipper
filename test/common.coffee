assert = require('assert')
exec = require('child_process').exec
fs = require('fs')

module.exports =
    extract: (zipName, cb) ->
        fs.mkdirSync('tmp/' + zipName)
        exec('unzip tmp/' + zipName + '.zip -d tmp/' + zipName, cb)

    compareFiles: (fileA, fileB) ->
        srcA = fs.readFileSync(fileA, 'utf8')
        srcB = fs.readFileSync(fileB, 'utf8')
        assert.equal(srcA, srcB)
