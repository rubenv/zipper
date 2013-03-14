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
                files: ['src/*', 'lib/*.js', 'test/**.coffee']
                tasks: ['test']

        mochacli:
            options:
                files: 'test/*_test.coffee'
                compilers: ['coffee:coffee-script']
            spec:
                options:
                    reporter: 'spec'

    @registerTask 'default', ['test']
    @registerTask 'build', ['clean', 'jshint']
    @registerTask 'package', ['build', 'release']
    @registerTask 'test', ['build', 'mkdir', 'mochacli']
