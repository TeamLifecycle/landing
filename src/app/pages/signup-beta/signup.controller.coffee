API_HOST = undefined

angular.module 'landing'
  .controller 'SignupBetaController', ($scope, $location, $state,  $http) ->
    'ngInject'
    vm = this
    console.log "controller sb"

    $scope.submitSignupBeta = ->
      $("button[type=submit]").prop "disabled", true
      Parse.initialize "faBivJ7dLEip3KFvhmeGf1w4dqIzMu7UG9i1XOk9", "bfSdm0J6TJFlNM9EIvoRY4unbAxP0WKMqMIFMN3C"
      
      email = $scope.newsignup.email
      Signup = Parse.Object.extend('signups')
      signup = new Signup
      signup.set 'fullName', $scope.newsignup.fullname
      signup.set 'email', email
      signup.set 'company', $scope.newsignup.company
      signup.set 'hearAbout', $scope.newsignup.hear
      signup.set 'numberUsers', $scope.newsignup.users
      signup.save null,
        success: (signup) ->
          $state.go 'thanks-beta'
          $("button[type=submit]").prop "disabled", false

          # send to our api
          thisHost = document.location.hostname
          switch thisHost
            when "localhost" then API_HOST = "http://localhost:3400/v1"
            when "lifecycle.io" then API_HOST = "https://api.lifecycle.io/v1"
            when "dev.lifecycle.io" then API_HOST = "http://api-dev.lifecycle.io/v1"
          $http(
            method: 'POST'
            url: "#{API_HOST}/public/signup/beta"
            headers: "Content-Type": "application/json"
            data: email: email
          ).then ((response) ->

            unless thisHost is "localhost" or window.DEV
              slackNotifier.configure
                url: "https://hooks.slack.com/services/" + "T029N0883/B0CLT34KW/UqDB8JCzoV977GMlK9exFuJg"
              slackNotifier.send "New landing page beta signup: #{JSON.stringify($scope.newsignup)}"
        error: (signup, error) ->
          console.error signup, error
          $("button[type=submit]").prop "disabled", false
          unless thisHost is "localhost"
            slackNotifier.configure
              url: "https://hooks.slack.com/services/" + "T029N0883/B0CLT34KW/UqDB8JCzoV977GMlK9exFuJg"
            slackNotifier.send "New landing beta signup ERROR! #{JSON.stringify(response)}"
