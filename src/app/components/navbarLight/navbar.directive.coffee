angular.module 'landing'
  .directive 'acmeNavbarLight', ->

    NavbarLightController = (moment, config, $urlRouter, $state, $scope, $timeout) ->
      'ngInject'
      vm = this
      vm.relativeDate = moment(vm.creationDate).fromNow()
      $scope.signin = "#{config().webappUrl}/sign-in"
      $scope.waitinglist = "#{config().webappUrl}/sign-up/waitinglist"

      # TODO definitely a better way to do this...
      $timeout ->
        $('.dropdown-toggle').dropdown()
      , 1000

    directive =
      restrict: 'E'
      templateUrl: 'app/components/navbarLight/navbar.html'
      scope: creationDate: '='
      controller: NavbarLightController
      controllerAs: 'vm'
      bindToController: true
