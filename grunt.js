module.exports = function(grunt) {

  grunt.loadNpmTasks('grunt-coffee');

  // Project configuration.
  grunt.initConfig({
    lint: {
      all: ['grunt.js']
    },

    coffee: {
      app: {
        src:  'app/assets/coffee/**/*.coffee',
        dest: 'public/javascripts/',
        options: {
          bare: false
        }
      }
    },

    watch: {
      files: '<config:coffee.app.src>',
      tasks: 'coffee'
    }
  });

  // Default task.
  grunt.registerTask('default', 'lint watch');

};


