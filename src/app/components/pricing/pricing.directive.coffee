angular.module 'landing'
  .directive 'pricingWidget', ->

    PartnersController = ($scope) ->
      'ngInject'

      $scope.options =
        orientation: 'vertical'
        direction: 'rtl'

      $scope.setMarketingAutomation = ->
        $scope.options.start = 10
        $scope.options.range =
            min: 0
            max: 14


      $scope.setSupport = ->
        $scope.options.start = 13240
        $scope.options.range =
            min: 2340
            max: 23322   

      $scope.eventHandlers =
        update: (values, handle, unencoded) ->
          console.log "update", values, handle, unencoded
          $scope.currentValue = values[0]
        # slide: (values, handle, unencoded) ->
        #   console.log "slide", values, handle, unencoded
        # set: (values, handle, unencoded) ->
        #   console.log "set", values, handle, unencoded
        # change: (values, handle, unencoded)->
        #   console.log "change", values, handle, unencoded


      $scope.setMarketingAutomation()
        
    directive =
      restrict: 'E'
      templateUrl: 'app/components/pricing/pricing.html'
      # scope: creationDate: '='
      controller: PartnersController
      # controllerAs: 'vm'
      # bindToController: true
