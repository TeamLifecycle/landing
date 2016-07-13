angular.module 'landing'
  .directive 'navbarTop', ->

    NavbarController = (config, $scope) ->
      'ngInject'
      vm = this
      # vm.tabClass = "harry"
      $scope.signin = "#{config().webappUrl}/sign-in"
      $scope.waitinglist = "#{config().webappUrl}/sign-up/waitinglist"
      # $scope.light = btnService.isCollapsedUpload
      $scope.shadeClass = vm.shadeClass

    directive =
      restrict: 'E'
      templateUrl: 'app/components/navbar/navbar.html'
      scope: shadeClass: '@'
      controller: NavbarController
      controllerAs: 'vm'
      bindToController: true
