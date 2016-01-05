angular.module 'landing'
  .directive 'acmeNavbar', ->

    NavbarController = (moment, $urlRouter, $state) ->
      'ngInject'
      vm = this
      vm.relativeDate = moment(vm.creationDate).fromNow()

      isActive = (route) ->
        return true if route is $state.current.name

      vm.isActive = isActive
      return

    directive =
      restrict: 'E'
      templateUrl: 'app/components/navbar/navbar.html'
      scope: creationDate: '='
      controller: NavbarController
      controllerAs: 'vm'
      bindToController: true
