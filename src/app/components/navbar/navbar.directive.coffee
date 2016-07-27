angular.module 'landing'
  .directive 'navbarTop', ->

    NavbarController = (config, $scope, $document, $window) ->
      'ngInject'
      vm = this
      $scope.signin = "#{config().webappUrl}/sign-in"
      $scope.waitinglist = "#{config().webappUrl}/sign-up/waitinglist"
      $scope.shadeClass = vm.shadeClass

      $document.bind 'scroll', ->
        checkScroll $window, $scope


    directive =
      restrict: 'E'
      templateUrl: 'app/components/navbar/navbar.html'
      scope: shadeClass: '@'
      controller: NavbarController
      controllerAs: 'vm'
      bindToController: true

checkScroll = ($window, $scope) ->
  if $window.scrollY > 10
    # remove light shadeclass if scrolled
    $scope.scrolledClass = "scrolled"
    $scope.$apply()
  else
    $scope.scrolledClass = ""
    $scope.$apply()