angular.module 'landing'
  .directive 'pricingWidget', ->

    PartnersController = ($scope) ->
      'ngInject'
      vm = this

      # $scope.single =
      #   start: 5
      # $scope.options =
      #   start: 3
      $scope.$watch 'test.single', (newVal, oldVal) ->
        console.log 'Value has changed', newVal, oldVal
      console.log $scope

    directive =
      restrict: 'E'
      templateUrl: 'app/components/pricing/pricing.html'
      # scope: creationDate: '='
      controller: PartnersController
      controllerAs: 'vm'
      # bindToController: true
