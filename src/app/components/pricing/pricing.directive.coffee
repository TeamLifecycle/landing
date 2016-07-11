angular.module 'landing'
  .directive 'pricingWidget', ->

    # PartnersController = ->
      # 'ngInject'
      # vm = this

    directive =
      restrict: 'E'
      templateUrl: 'app/components/pricing/pricing.html'
      # scope: creationDate: '='
      # controller: PartnersController
      # controllerAs: 'vm'
      # bindToController: true
