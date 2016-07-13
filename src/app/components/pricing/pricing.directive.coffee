angular.module 'landing'
  .directive 'pricingWidget', ->

    PartnersController = ($scope) ->
      'ngInject'
      # vm = this

      # $scope.single =
      #   start: 5
      $scope.options =
        start: 20
        range: 
          min: 0
          max: 100
      $scope.eventHandlers =
        update: (values, handle, unencoded) ->
          console.log "update", values, handle, unencoded
        slide: (values, handle, unencoded) ->
          console.log "slide", values, handle, unencoded
        set: (values, handle, unencoded) ->
          console.log "set", values, handle, unencoded
        change: (values, handle, unencoded)->
          console.log "change", values, handle, unencoded
        
    directive =
      restrict: 'E'
      templateUrl: 'app/components/pricing/pricing.html'
      # scope: creationDate: '='
      controller: PartnersController
      # controllerAs: 'vm'
      # bindToController: true
