angular.module 'landing'
  .directive 'footerMain', ->

    FooterController = ->
      'ngInject'
      vm = this

    directive =
      restrict: 'E'
      templateUrl: 'app/components/footer/footer.html'
      scope: creationDate: '='
      controller: FooterController
      controllerAs: 'vm'
      bindToController: true
