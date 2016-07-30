angular.module('landing').controller 'ModalDemoCtrl', ($scope, $uibModal, $log) ->
  console.log "modalsss"
  $scope.items = [
    'item1'
    'item2'
    'item3'
  ]
  $scope.animationsEnabled = true

  $scope.open = (size) ->
    console.log "open"
    modalInstance = $uibModal.open(
      animation: $scope.animationsEnabled
      templateUrl: 'myModalContent.html'
      controller: 'ModalInstanceCtrl'
      size: size
      resolve: items: ->
        $scope.items
    )
    modalInstance.result.then ((selectedItem) ->
      $scope.selected = selectedItem
    ), ->
      $log.info 'Modal dismissed at: ' + new Date

  $scope.toggleAnimation = ->
    $scope.animationsEnabled = !$scope.animationsEnabled


angular.module('landing').controller 'ModalInstanceCtrl', ($scope, $uibModalInstance, items) ->
  console.log "hiiiii"
  $scope.items = items
  $scope.selected = item: $scope.items[0]

  $scope.ok = ->
    $uibModalInstance.close $scope.selected.item

  $scope.cancel = ->
    $uibModalInstance.dismiss 'cancel'
