angular.module 'landing'
  .controller 'SignupController', ($scope) ->
    'ngInject'
    vm = this

    submitForm = ->
      console.log "submitForm"


    # console.log "$scope", $scope

    vm.submitForm = submitForm
    $scope.submitForm2 = ->
      console.log "st2"
    vm.testclick = ->
      console.log "testclick"
    return
