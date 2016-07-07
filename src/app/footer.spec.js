import 'zone.js/dist/zone';
import 'zone.js/dist/async-test';
import {Footer} from './footer';
import {inject, async, TestComponentBuilder} from '@angular/core/testing';

describe('footer component', () => {
  it('should render \'FountainJS team\'', async(inject([TestComponentBuilder], tcb => {
    tcb.createAsync(Footer)
      .then(fixture => {
        fixture.detectChanges();
        const footer = fixture.nativeElement;
        expect(footer.querySelector('a').textContent.trim()).toBe('FountainJS team');
      });
  })));
});
