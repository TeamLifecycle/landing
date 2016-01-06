angular.module 'landing'
  .config ($logProvider, toastrConfig) ->
    'ngInject'
    # Enable log
    $logProvider.debugEnabled true
    # Set options third-party lib
    toastrConfig.allowHtml = true
    toastrConfig.timeOut = 3000
    toastrConfig.positionClass = 'toast-top-right'
    toastrConfig.preventDuplicates = true
    toastrConfig.progressBar = true
    # console.log "ParseProvider", ParseProvider
    # ParseProvider.initialize("PARSE_APPLICATION_ID", "PARSE_REST_API_KEY");

