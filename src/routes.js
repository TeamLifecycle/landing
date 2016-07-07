import {Injectable} from '@angular/core';
import {Main} from './app/main';

const INITIAL_STATES = [
  {name: 'App', url: '/', component: Main}
];

@Injectable()
export class MyUIRouterConfig {
  configure(uiRouter) {
    uiRouter.urlRouterProvider.otherwise(() => uiRouter.stateService.go('App', null, null));
    uiRouter.stateRegistry.root();
    INITIAL_STATES.forEach(state => uiRouter.stateRegistry.register(state));
  }
}
