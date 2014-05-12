/**
 * Created by bvolosincu on 5/12/2014.
 */
module.exports = function(grunt) {


    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        copy: {
            dev: {
                files: [
                    {expand: true, src: ['./*.html'], dest: 'build/CoffeePubSub'},
                    {expand: true, src: ['./main/main.js'], dest: 'build/CoffeePubSub'},
                    {expand: true, src: ['./libs/*/*.js', './main/*/*.js'], dest: 'build/CoffeePubSub'}
                ]
            }
        }

    });

    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.registerTask('default', ['copy:dev']);


};