angular.module 'landing'
  .directive 'pricingWidget', ->

    PartnersController = ($scope, $rootScope) ->
      'ngInject'

      $scope.options =
        orientation: 'vertical'
        direction: 'rtl'

      $scope.Math=Math;

      $scope.setMarketingAutomation = ->
        $scope.type = "marketing"
        $rootScope.pricingType = "marketing"
        # $rootScope.$apply()
        $scope.options.start = 0
        $scope.options.step = 10000
        $scope.options.range =
            min: 0
            max: 200000
            
      $scope.setSupport = ->
        $scope.type = "support"
        $rootScope.pricingType = "support"
        # $rootScope.$apply()
        $scope.options.start = 0
        $scope.options.step = 10000
        $scope.options.range =
            min: 0
            max: 200000

      $scope.eventHandlers =
        update: (values, handle, unencoded) ->
          console.log "update", values, handle, unencoded
          $scope.currentValue = String(values[0]/1).replace /\B(?=(\d{3})+(?!\d))/g, ','
          if values[0]/1 is 0
            $scope.price = 0
          else
            $scope.price = String((((Math.floor(values[0]/10000) * 10000)/1000)*2) + 20).replace /\B(?=(\d{3})+(?!\d))/g, ','
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
