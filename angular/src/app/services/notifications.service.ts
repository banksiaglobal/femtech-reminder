import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpClient } from '@angular/common/http';
import { INotificationByAge } from '../models/listNotificationsByAge';


@Injectable({
  providedIn: 'root',
})
export class NotificationsService {

  constructor(private http: HttpClient) {
  }

  getListNotificationsByAge (): Observable<INotificationByAge[]> {
    return this.http.get<INotificationByAge[]>(environment.API_URL + '/recommendation-age');
  }
}
