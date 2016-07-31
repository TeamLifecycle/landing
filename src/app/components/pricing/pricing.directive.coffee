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
        $scope.options.start = 0
        $scope.options.step = 10000
        $scope.options.range =
            min: 0
            max: 200000
            
      $scope.setSupport = ->
        $scope.type = "support"
        $rootScope.pricingType = "support"
        $scope.options.start = 0
        $scope.options.step = 10000
        $scope.options.range =
            min: 0
            max: 200000

      $scope.eventHandlers =
        update: (values, handle, unencoded) ->
          console.log "update", values, handle, unencoded
          peopleNum = values[0]
          setLevel $scope, peopleNum
          $scope.peopleNumPretty = String(peopleNum/1).replace /\B(?=(\d{3})+(?!\d))/g, ','
          if $scope.peopleNumPretty is "200,000" then $scope.peopleNumPretty = "200,000+"
          if values[0]/1 is 0
            $scope.price = 0
          else
            $scope.price = String((((Math.floor(values[0]/10000) * 10000)/1000)*2) + 20).replace /\B(?=(\d{3})+(?!\d))/g, ','

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


setLevel = (scope, numPeople) ->
    console.log numPeople
    if numPeople < 1
      scope["level"] = 1
    else if numPeople < 200000
      scope["level"] = 2
    else
      scope["level"] = 3