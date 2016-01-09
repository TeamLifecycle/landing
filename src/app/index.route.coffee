angular.module 'landing'
  .config ($stateProvider, $urlRouterProvider, $locationProvider) ->
    'ngInject'
    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'app/pages/landing/landing.html'
        controller: 'LandingController'
        controllerAs: 'landing'
      .state 'signup',
        url: '/sign-up'
        templateUrl: 'app/pages/signup/signup.html'
        controller: 'SignupController'
        controllerAs: 'signup'
      .state 'thanks',
        url: '/thanks'
        templateUrl: 'app/pages/signup/thanks.html'
      .state 'unsubscribed',
        url: '/unsubscribed'
        templateUrl: 'app/pages/unsubscribed/unsubscribed.html'
      .state '404',
        url: '/404'
        templateUrl: 'app/pages/404/404.html'
      # .state 'about',
      #   url: '/about'
      #   templateUrl: 'app/pages/about/about.html'
      #   controller: 'AboutController'
      #   controllerAs: 'about'
      # .state 'contact',
      #   url: '/contact'
      #   templateUrl: 'app/pages/contact/contact.html'
      #   controller: 'ContactController'
      #   controllerAs: 'contact'
    
    $locationProvider.html5Mode true

    $urlRouterProvider.otherwise '/'
