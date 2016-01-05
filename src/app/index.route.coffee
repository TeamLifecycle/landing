angular.module 'landing'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'app/landing/landing.html'
        controller: 'LandingController'
        controllerAs: 'landing'
      .state 'about',
        url: '/about'
        templateUrl: 'app/about/about.html'
        controller: 'AboutController'
        controllerAs: 'about'
      .state 'contact',
        url: '/contact'
        templateUrl: 'app/contact/contact.html'
        controller: 'ContactController'
        controllerAs: 'contact'

    $urlRouterProvider.otherwise '/'
