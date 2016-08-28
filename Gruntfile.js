/**
 * Created by bvolosincu on 5/12/2014.
 */
module.exports = function(grunt) {


    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        /**
         * copy and sync must be kept identical
         **/

        copy: {
            source: {
                files: [
                    {expand: true, src: ['./*.html'], dest: 'build/coffee-pub-sub'},
		    {expand: true, src: ['./main/*.js'], dest: 'build/coffee-pub-sub'},
		    {expand: true, src: ['./main/*/*.js'], dest: 'build/coffee-pub-sub'},
		    {expand: true, src: ['./main/**/js/*.js'], dest: 'build/coffee-pub-sub'}
		]
            },
            libs: {
                files: [
                    {expand: true, src: ['./libs/requirejs/*.js', './libs/underscore/*.js'], dest: 'build/coffee-pub-sub'},
		    {expand: true, src: ['./libs/jasmine/lib/jasmine-core/*.js', './libs/jasmine/lib/jasmine-core/*.css'], dest: 'build/coffee-pub-sub/libs/jasmine', flatten: true},
		    {expand: true, src: ['./libs/jquery/dist/jquery.min.js'], dest: 'build/coffee-pub-sub/libs/jquery', flatten: true}
                ]
            },
            dest: {
                files: [
                    {expand: true, src: ['./main/core/publisher.js'], dest: 'build/dest', flatten: true},
                    {expand: true, src: ['./main/src/publisher.coffee'], dest: 'build/dest', flatten: true}
                ]
            }

        },

        sync: {
            source: {
                files: [
                    {expand: true, src: ['./*.html'], dest: 'build/coffee-pub-sub'},
                    {expand: true, src: ['./main/*.js'], dest: 'build/coffee-pub-sub'},
                    {expand: true, src: ['./main/*/*.js'], dest: 'build/coffee-pub-sub'},
                    {expand: true, src: ['./main/**/js/*.js'], dest: 'build/coffee-pub-sub'}
                ],
                verbose: true
            },
            libs: {
                files: [
                    {expand: true, src: ['./libs/requirejs/*.js', './libs/underscore/*.js'], dest: 'build/coffee-pub-sub'},
                    {expand: true, src: ['./libs/jasmine/lib/jasmine-core/*.js', './libs/jasmine/lib/jasmine-core/*.css'], dest: 'build/coffee-pub-sub/libs/jasmine', flatten: true},
                    {expand: true, src: ['./libs/jquery/dist/jquery.min.js'], dest: 'build/coffee-pub-sub/libs/jq00uery', flatten: true}
                ],
                verbose: true
            },
            dest: {
                files: [
                    {expand: true, src: ['./main/core/publisher.js'], dest: 'build/dest', flatten: true},
                    {expand: true, src: ['./main/src/publisher.coffee'], dest: 'build/dest', flatten: true}
                ]
            }
        },

        uglify: {
            minlib: {
                files: {
                    'build/dest/publisher.min.js': ['./main/core/publisher.js']
                }
            }
        },
	    

	coffee: {
	    compileBare: {
		options: {
		    bare: true
		},
		files: [
		    {
			'main/main.js': 'main/main.coffee'
		    },
		    {
			expand: true,
			cwd: 'main/src/',
			src: ['polyfill.coffee', 'publisher.coffee'],
			dest: 'main/core/',
			ext: '.js'
			
		    },
		    {
			expand: true,
			cwd: 'main/specs/coffee/',
			src: ['off-spec.coffee', 'on-trigger-spec.coffee',
			      'priority-spec.coffee', 'trigger-spec.coffee'],
			dest: 'main/specs/js/',
			ext: '.js'
		    }]
		
	    }
	    
	    
		    
	}
	
    });
    
    

    grunt.loadNpmTasks('grunt-sync');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-coffee');

    grunt.registerTask('sync', ['sync:source', 'sync:libs']);
    grunt.registerTask('default', ['coffee', 'copy:source', 'copy:libs', 'copy:dest', 'uglify:minlib']);



};
