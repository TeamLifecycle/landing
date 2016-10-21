angular.module 'landing'
  .run ($log, $rootScope) ->
    'ngInject'
    $log.debug 'runBlock end'
    config =
    	webapp: {}
    switch window.location.hostname
    	when "localhost"
    		config.webapp.host = "http://localhost:3003"
    	when "lifecycle.io"
    		config.webapp.host = "https://app.lifecycle.io"
    	when "dev.lifecycle.io"
    		config.webapp.host = "https://app-dev.lifecycle.io"
    	when "stage.lifecycle.io"
    		config.webapp.host = "https://app-stage.lifecycle.io"

    config.webapp.signup = "#{config.webapp.host}/sign-up/beta"
    config.webapp.signin = "#{config.webapp.host}/sign-in"
    config.signin = "#{config.webapp.host}/sign-in"

    console.log "config", config
    $rootScope.config = config
