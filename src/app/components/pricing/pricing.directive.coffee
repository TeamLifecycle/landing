angular.module 'landing'
  .directive 'pricingWidget', ->

    PartnersController = ($scope) ->
      'ngInject'

      $scope.options =
        orientation: 'vertical'
        direction: 'rtl'

      $scope.Math=Math;

      $scope.setMarketingAutomation = ->
        $scope.type = "marketing"
        $scope.options.start = 0
        $scope.options.step = 1
        $scope.options.range =
            min: 0
            max: 200000
        console.log $scope

      $scope.setSupport = ->
        $scope.type = "support"
        $scope.options.start = 0
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

      if $scope.onlyShow
        if $scope.onlyShow is "marketing"
          $scope.setMarketingAutomation()
        else if $scope.onlyShow is "support"
          $scope.setSupport()
      else
        $scope.setMarketingAutomation()
        
    directive =
      restrict: 'E'
      templateUrl: 'app/components/pricing/pricing.html'
      controller: PartnersController
      scope: 
        onlyShow: '@'
