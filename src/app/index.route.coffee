angular.module 'landing'
  .config ($stateProvider, $urlRouterProvider, $locationProvider) ->
    'ngInject'
    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'app/landing/landing.html'
        controller: 'LandingController'
        controllerAs: 'landing'
      .state 'signup',
        url: '/sign-up'
        templateUrl: 'app/signup/signup.html'
        controller: 'SignupController'
        controllerAs: 'signup'
      .state 'about',
        url: '/about'
        templateUrl: 'app/about/about.html'
        controller: 'AboutController'
        controllerAs: 'about'
      # .state 'contact',
      #   url: '/contact'
      #   templateUrl: 'app/contact/contact.html'
      #   controller: 'ContactController'
      #   controllerAs: 'contact'
    
    $locationProvider.html5Mode true

    $urlRouterProvider.otherwise '/'
