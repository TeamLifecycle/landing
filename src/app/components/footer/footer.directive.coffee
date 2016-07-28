angular.module 'landing'
  .directive 'footerMain', ->

    FooterController = ($scope, $timeout) ->
      'ngInject'
      vm = this
      $scope.header = vm.header
      $scope.ctaText = vm.ctaText
      $scope.ctaButtonText = vm.ctaButtonText
      $scope.img = vm.img

      $.get('https://teamlifecycle.ghost.io/ghost/api/v0.1/posts/?limit=3&client_id=ghost-frontend&client_secret=99b3a38f41d8').done((data) ->
        $scope.posts = data.posts
        console.log data
        # $scope.$apply()
      ).fail (err) ->
        console.error err



    directive =
      restrict: 'E'
      templateUrl: 'app/components/footer/footer.html'
      scope:
        posts: '='
        ctaText: '@'
        ctaButtonText: '@'
        img: '@'
      compile: (element, attrs) ->
        console.log element, attrs
        if !attrs.ctaText then attrs.ctaText = "Ready to Start Messaging with Your Customers?" 
        if !attrs.ctaButtonText then attrs.ctaButtonText = "Request Invite" 
        if !attrs.img then attrs.img = "/assets/img/landing/footer_bg.png"
      controller: FooterController
      controllerAs: 'vm'
      bindToController: true
