angular.module 'landing'
  .controller 'SignupController', ($scope, $location, $state) ->
    'ngInject'
    vm = this

    $scope.submitSignup = ->
      Parse.initialize "faBivJ7dLEip3KFvhmeGf1w4dqIzMu7UG9i1XOk9", "bfSdm0J6TJFlNM9EIvoRY4unbAxP0WKMqMIFMN3C"
      Signup = Parse.Object.extend('signups')
      signup = new Signup
      signup.set 'fullName', $scope.newsignup.fullname
      signup.set 'email', $scope.newsignup.email
      signup.set 'company', $scope.newsignup.company
      signup.set 'hearAbout', $scope.newsignup.hear
      signup.set 'numberUsers', $scope.newsignup.users
      signup.save null,
        success: (signup) ->
          $state.go 'thanks'
          slackNotifier.configure url: 'https://hooks.slack.com/services/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'
          slackNotifier.send "New landing page signup: #{JSON.stringify($scope.newsignup)}"
        error: (signup, error) ->
          console.error signup, error

