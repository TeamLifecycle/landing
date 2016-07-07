import 'zone.js/dist/zone';
import 'zone.js/dist/async-test';
import {MockBackend} from '@angular/http/testing';
import {Http, BaseRequestOptions, Response, ResponseOptions} from '@angular/http';
import {Component, Input, provide} from '@angular/core';
import {Techs} from './techs';
import {Tech} from './tech';
import {inject, async, TestComponentBuilder, addProviders} from '@angular/core/testing';

import {Observable} from 'rxjs/Rx';

@Component({
  selector: 'Tech',
  template: ''
})
class MockComponent {
  @Input() tech;
}

const techsJson = [
  {
    key: 'gulp',
    title: 'Gulp',
    logo: 'http://fountainjs.io/assets/imgs/gulp.png',
    text1: 'The streaming build system',
    text2: 'Automate and enhance your workflow'
  },
  {
    key: 'react',
    title: 'React',
    logo: 'http://fountainjs.io/assets/imgs/react.png',
    text1: 'A JavaScript library for building user interfaces',
    text2: 'A declarative, efficient, and flexible JavaScript library for building user interfaces'
  },
  {
    key: 'angular1',
    title: 'Angular 1',
    logo: 'http://fountainjs.io/assets/imgs/angular1.png',
    text1: 'HTML enhanced for web apps!',
    text2: 'AngularJS lets you extend HTML vocabulary for your application. The resulting environment is extraordinarily expressive, readable, and quick to develop.'
  }
];

describe('techs component', () => {
  describe('techs component methods', () => {
    beforeEach(() => {
      addProviders([
        Techs,
        MockBackend,
        BaseRequestOptions,
        provide(Http, {
          useFactory: (backend, defaultOptions) => new Http(backend, defaultOptions),
          deps: [MockBackend, BaseRequestOptions]
        })
      ]);
    });

    it('should get techs', inject([MockBackend, Techs], (mockBackend, techs) => {
      let conn;
      const response = new Response(new ResponseOptions({body: techsJson}));
      mockBackend.connections.subscribe(connection => {
        conn = connection;
      });
      techs.getTechs().subscribe(jsonObject => {
        techs.techs = jsonObject;
      });
      conn.mockRespond(response);
      expect(techs.techs.length).toBe(3);
      mockBackend.verifyNoPendingRequests();
    }));
  });

  describe('techs component rendering', () => {
    beforeEach(() => {
      Techs.prototype.getTechs = function getTechs() {
        const response = new Response(new ResponseOptions({body: techsJson}));
        return Observable.of(response).map(response => response.json());
      };
    });

    it('should mock the techs and render 3 elements <tech>', async(inject([TestComponentBuilder], tcb => {
      return tcb
        .overrideDirective(Techs, Tech, MockComponent)
        .createAsync(Techs)
        .then(fixture => {
          fixture.detectChanges();
          const techs = fixture.nativeElement;
          expect(techs.querySelectorAll('tech').length).toBe(3);
        });
    })));
  });
});
