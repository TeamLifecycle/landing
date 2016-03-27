API_HOST = undefined

angular.module 'landing'
  .controller 'SignupController', ($scope, $location, $state, $http) ->
    'ngInject'
    vm = this

    $scope.submitSignup = ->
      $("button[type=submit]").prop "disabled", true
      email = $scope.newsignup.email
      thisHost = document.location.hostname
      switch thisHost
        when "localhost" then API_HOST = "http://localhost:3400/v1"
        when "lifecycle.io" then API_HOST = "https://api.lifecycle.io/v1"
        when "dev.lifecycle.io" then API_HOST = "http://api-dev.lifecycle.io/v1"
      $http(
        method: 'POST'
        url: "#{API_HOST}/public/signup"
        headers: "Content-Type": "application/json"
        data: email: email
      ).then ((response) ->
        # success
        $state.go 'thanks'
        $("button[type=submit]").prop "disabled", false
        unless thisHost is "localhost" or window.DEV
          slackNotifier.configure
            url: "https://hooks.slack.com/services/" + "T029N0883/B0CLT34KW/UqDB8JCzoV977GMlK9exFuJg"
          slackNotifier.send "New landing signup! (#{email})"
      ), (response) ->
        # error
        console.error response if response
        $("button[type=submit]").prop "disabled", false
        unless thisHost is "localhost"
          slackNotifier.configure
            url: "https://hooks.slack.com/services/" + "T029N0883/B0CLT34KW/UqDB8JCzoV977GMlK9exFuJg"
          slackNotifier.send "New landing signup ERROR! #{JSON.stringify(response)}"

