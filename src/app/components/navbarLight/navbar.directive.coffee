angular.module 'landing'
  .directive 'acmeNavbarLight', ->

    NavbarLightController = (moment, $urlRouter, $state) ->
      'ngInject'
      vm = this
      vm.relativeDate = moment(vm.creationDate).fromNow()
      vm.signin = "https://www.espn.com"

      isActive = (route) ->
        return true if route is $state.current.name

      vm.isActive = isActive
      return

    directive =
      restrict: 'E'
      templateUrl: 'app/components/navbarLight/navbar.html'
      scope: creationDate: '='
      controller: NavbarLightController
      controllerAs: 'vm'
      bindToController: true
