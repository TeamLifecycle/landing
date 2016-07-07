import 'zone.js/dist/zone';
import 'zone.js/dist/async-test';
import {Tech} from './tech';
import {inject, async, TestComponentBuilder} from '@angular/core/testing';

describe('tech component', () => {
  it('should render Gulp', async(inject([TestComponentBuilder], tcb => {
    tcb.createAsync(Tech)
      .then(fixture => {
        fixture.componentInstance.tech = {
          key: 'gulp',
          title: 'Gulp',
          logo: 'http://fountainjs.io/assets/imgs/gulp.png',
          text1: 'The streaming build system',
          text2: 'Automate and enhance your workflow'
        };
        fixture.detectChanges();
        const tech = fixture.nativeElement;
        expect(tech.querySelector('h3').textContent.trim()).toBe('Gulp');
      });
  })));
});
