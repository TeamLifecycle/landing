angular.module 'landing'
  .directive 'acmeNavbarLight', ->

    NavbarLightController = (moment, config, $urlRouter, $state, $scope, $timeout, $log) ->
      'ngInject'
      $scope.signin = "#{config().webappUrl}/sign-in"
      $scope.waitinglist = "#{config().webappUrl}/sign-up/waitinglist"

    directive =
      restrict: 'E'
      templateUrl: 'app/components/navbarLight/navbar.html'
      # scope: creationDate: '='
      controller: NavbarLightController
      # controllerAs: 'vm'
      bindToController: true
