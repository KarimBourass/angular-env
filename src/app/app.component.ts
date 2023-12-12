import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  styleUrls: ['./app.component.scss'],
  template: `
    <div class="cont">
    <h1>Hello {{title}}!</h1>
    <p>Env variable from .env: <b>{{ env }}</b></p>
    </div>
  `,
})
export class AppComponent {
  title = 'angular-env';
  env = import.meta.env['NG_ENV'];
}
