angular.module 'landing'
  .directive 'footerMain', ->

    FooterController = ($scope, $timeout) ->
      'ngInject'
      vm = this

      $.get('https://teamlifecycle.ghost.io/ghost/api/v0.1/posts/?limit=3&client_id=ghost-frontend&client_secret=99b3a38f41d8').done((data) ->
        $scope.posts = data.posts
        $scope.$apply()
        console.log $scope
        return
      ).fail (err) ->
        console.log err
        return

    directive =
      restrict: 'E'
      templateUrl: 'app/components/footer/footer.html'
      scope: posts: '='
      controller: FooterController
      controllerAs: 'vm'
      bindToController: true
