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


      # ghostData = 
      #   {
      #     "posts":[{
      #       "id":1,
      #       "uuid":"bc0a0924-b49c-45c8-897d-728f6acba7c9",
      #       "title":"Welcome to Ghost",
      #       "slug":"welcome-to-ghost",
      #       "markdown":"You're live! Nice. We've put together a little post to introduce you to the Ghost editor and get you started.",
      #       "html":"<p>You're live! Nice. We've put together a little post to introduce you to the Ghost editor and get you started.</p>",
      #       "image":null,
      #       "featured":false,
      #       "page":false,
      #       "status":"published",
      #       "language":"en_US",
      #       "meta_title":null,
      #       "meta_description":null,
      #       "created_at":"2014-11-17T19:02:27.147Z",
      #       "created_by":1,
      #       "updated_at":"2014-11-17T19:02:27.147Z",
      #       "updated_by":1,
      #       "published_at":"2014-11-17T19:02:27.173Z",
      #       "published_by":1,
      #       "author":1,
      #       "url":"/welcome-to-ghost/"
      #     }, {
      #       "id":2,
      #       "uuid":"ac0a0374-a43c-15c4-391b-128d6bbba7c5",
      #       "title":"Lorem Ipsum Dolor",
      #       "slug":"lorem-ipsum-dolor",
      #       "markdown":"Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod\n\n",
      #       "html":"<p>Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod</p>",
      #       "image":null,
      #       "featured":false,
      #       "page":false,
      #       "status":"published",
      #       "language":"en_US",
      #       "meta_title":null,
      #       "meta_description":null,
      #       "created_at":"2014-11-18T19:02:27.147Z",
      #       "created_by":1,
      #       "updated_at":"2014-11-18T19:02:27.147Z",
      #       "updated_by":1,
      #       "published_at":"2014-11-18T19:02:27.173Z",
      #       "published_by":1,
      #       "author":1,
      #       "url":"/lorem-ipsum-dolor/"
      #     }],
      #     "meta":{
      #       "pagination":{
      #         "page":1,
      #         "limit":2,
      #         "pages":1,
      #         "total":1,
      #         "next":null,
      #         "prev":null
      #       }
      #     }
      #   }
      #console.log "test "
      #console.log ghostData
      #$scope.posts = ghostData.posts
      #console.log "scope", $scope


    directive =
      restrict: 'E'
      templateUrl: 'app/components/footer/footer.html'
      scope: posts: '='
      controller: FooterController
      controllerAs: 'vm'
      bindToController: true
