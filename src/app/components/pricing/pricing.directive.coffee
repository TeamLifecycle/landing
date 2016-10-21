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
        $scope.options.step = 100
        $scope.options.range =
            min: 0
            max: 2000
            
      $scope.setSupport = ->
        $scope.type = "support"
        $rootScope.pricingType = "support"
        $scope.options.start = 0
        $scope.options.step = 100
        $scope.options.range =
            min: 0
            max: 2000

      $scope.eventHandlers =
        update: (values, handle, unencoded) ->
          console.log "update", values, handle, unencoded
          peopleNum = values[0]
          setLevel $scope, peopleNum
          $scope.peopleNumPretty = String(peopleNum/1).replace /\B(?=(\d{3})+(?!\d))/g, ','
          if $scope.peopleNumPretty is "2,000" then $scope.peopleNumPretty = "2,000+"
          if values[0]/1 is 0
            $scope.price = 0
          else
            #$scope.price = String((((Math.floor(values[0]/10000) * 10000)/1000)*2) + 20).replace /\B(?=(\d{3})+(?!\d))/g, ','
            $scope.price = calcMonthlyPlanDollars( peopleNum )

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
    # mvp
    if numPeople < 550
      scope["level"] = 1
      scope["planname"] = "MVP Plan"
    # growth
    else if numPeople < 1100
      scope["level"] = 2
      scope["planname"] = "Growth Plan"
    # enterprise
    else
      scope["level"] = 3
      scope["planname"] = "Enterprise Plan"

# Don't change these numbers here, change in helpers.coffee in the API project and then move over here to match
calcTierCost = (usage, unitPrice, usersPerUnit, unitCap, baselineUnits, baselineCost, isUnitFloored) ->
  units = ( usage - baselineUnits ) / usersPerUnit
  if isUnitFloored
    units = Math.floor( units )
  if unitCap and units > unitCap
    units = unitCap
  cost = ( units * unitPrice ) + baselineCost
  cost = Math.round( cost )
  return cost
  
calcMonthlyPlanDollars = (usage) ->
  # Tier 1
  if usage <= 150
    return 10
  else if usage < 550
    return calcTierCost usage, 10, 100, 4, 50, 0, true
  # Tier 2
  else if usage < 1100
    return calcTierCost usage, 7, 100, 5, 450, 40, true
  # Tier 3
  else
    return calcTierCost usage, 5, 200, 0, 950, 75, false
