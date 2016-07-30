angular.module 'landing'
  .config ($stateProvider, $urlRouterProvider, $locationProvider) ->
    'ngInject'
    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'app/pages/landing/landing.html'
        controller: 'LandingController'
        controllerAs: 'landing'
      .state 'support',
        url: '/products/support'
        templateUrl: 'app/pages/products/support.html'
      .state 'marketing',
        url: '/products/marketing'
        templateUrl: 'app/pages/products/marketing.html'
      .state 'chatbots',
        url: '/products/chatbots'
        templateUrl: 'app/pages/products/chatbots.html'
      .state 'pricing',
        url: '/pricing'
        templateUrl: 'app/pages/pricing/pricing.html'
      .state 'integrations',
        url: '/integrations'
        templateUrl: 'app/pages/integrations/integrations.html'
      .state 'terms',
        url: '/terms'
        templateUrl: 'app/pages/other/terms.html'
      .state 'privacy',
        url: '/privacy'
        templateUrl: 'app/pages/other/privacy.html'
      .state '404',
        url: '/404'
        templateUrl: 'app/pages/404/404.html'
    
    # $locationProvider.html5Mode true

    $urlRouterProvider.otherwise '/'
