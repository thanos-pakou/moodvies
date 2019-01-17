import { Injectable } from '@angular/core';

import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';

import { Observable } from 'rxjs/index';

@Injectable()
export class TokenInterceptor implements HttpInterceptor {

  constructor(  ) {}

  intercept(req: HttpRequest<any>,
            next: HttpHandler): Observable<HttpEvent<any>> {

    const token = localStorage.getItem('moodvies-jwt-token');
    if (token) {
      const authReq = req.clone({
        setHeaders: {
          Authorization: `JWT ${localStorage.getItem('moodvies-jwt-token')}`
        }
      });
      return next.handle(authReq);
    } else {
      const authr = req.clone({})
      return next.handle(authr)
    }
  }
}
