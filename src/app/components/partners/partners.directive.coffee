angular.module 'landing'
  .directive 'partnersLogos', ->

    # PartnersController = ->
      # 'ngInject'
      # vm = this

    directive =
      restrict: 'E'
      templateUrl: 'app/components/partners/partners.html'
      # scope: creationDate: '='
      # controller: PartnersController
      # controllerAs: 'vm'
      # bindToController: true
