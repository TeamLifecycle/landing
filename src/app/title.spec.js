import 'zone.js/dist/zone';
import 'zone.js/dist/async-test';
import {Title} from './title';
import {inject, async, TestComponentBuilder} from '@angular/core/testing';

describe('title component', () => {
  it('should render \'Allo, \'Allo!', async(inject([TestComponentBuilder], tcb => {
    tcb.createAsync(Title)
      .then(fixture => {
        fixture.detectChanges();
        const title = fixture.nativeElement;
        expect(title.querySelector('h1').textContent.trim()).toBe('\'Allo, \'Allo!');
      });
  })));
});
