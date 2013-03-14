assert = require 'assert'
zipper = require '..'
fs = require 'fs'

common = require './common'

describe 'addFile', ->
    it 'can add file', (done) ->
        zipfile = new zipper.Zipper('tmp/addfile.zip')
        zipfile.addFile 'test/sample-files/test.txt', 'test.txt', (err) ->
            assert.equal(err, null)
            done(err)

    it 'warns if the file cannot be found', (done) ->
        zipfile = new zipper.Zipper('tmp/not-found.zip')
        zipfile.addFile 'test/sample-files/not-found.txt', 'test.txt', (err) ->
            assert.notEqual(err, null)
            assert(!fs.existsSync('tmp/not-found.zip'))
            done()

    it 'can be extracted and contains the original file', (done) ->
        zipName = 'simple'

        zipfile = new zipper.Zipper('tmp/simple.zip')
        zipfile.addFile 'test/sample-files/test.txt', 'test.txt', (err) ->
            assert.equal(err, null)

            common.extract zipName, (err) ->
                assert.equal(err, null)
                common.compareFiles('tmp/simple/test.txt', 'test/sample-files/test.txt')
                done()
