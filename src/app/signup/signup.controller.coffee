angular.module 'landing'
  .controller 'SignupController', ($scope, $location) ->
    'ngInject'
    vm = this

    $scope.submitSignup = ->
      Parse.initialize "faBivJ7dLEip3KFvhmeGf1w4dqIzMu7UG9i1XOk9", "bfSdm0J6TJFlNM9EIvoRY4unbAxP0WKMqMIFMN3C"
      Signup = Parse.Object.extend('signups')
      signup = new Signup
      signup.set 'fullName', $scope.fullname
      signup.set 'email', $scope.email
      signup.set 'company', $scope.company
      signup.set 'hearAbout', $scope.hear
      signup.set 'numberUsers', $scope.users
      signup.save null,
        success: (signup) ->
          $location.path( "/thanks" );
        error: (signup, error) ->
