module.exports = (grunt) ->
    @loadNpmTasks('grunt-contrib-clean')
    @loadNpmTasks('grunt-contrib-jshint')
    @loadNpmTasks('grunt-contrib-watch')
    @loadNpmTasks('grunt-mocha-cli')
    @loadNpmTasks('grunt-mkdir')
    @loadNpmTasks('grunt-release')

    @initConfig
        jshint:
            all: ["lib/*.js"]
            options:
                jshintrc: ".jshintrc"

        clean:
            all: ['tmp']

        mkdir:
            all:
                options:
                    create: ['tmp']

        watch:
            all:
                files: ['src/*', 'lib/*.js', 'test/**.coffee', 'Gruntfile.coffee', 'Makefile', 'binding.gyp']
                tasks: ['test']

        mochacli:
            options:
                files: 'test/*_test.coffee'
                compilers: ['coffee:coffee-script']
            spec:
                options:
                    reporter: 'spec'

    @registerTask "make", "Run make", ->
        done = @async()

        grunt.util.spawn
            cmd: "make"
        , (error, result, code) ->
            grunt.log.writeln(result.stderr) if result.stderr
            grunt.log.writeln(result.stdout) if result.stdout
            done(!error)

    @registerTask 'default', ['test']
    @registerTask 'build', ['clean', 'jshint', 'make']
    @registerTask 'package', ['build', 'release']
    @registerTask 'test', ['build', 'mkdir', 'mochacli']
