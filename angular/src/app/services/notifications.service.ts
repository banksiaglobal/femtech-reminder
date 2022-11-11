import { Injectable } from '@angular/core';
import { Observable, shareReplay } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpClient } from '@angular/common/http';
import { IDataNotification } from '../models/IDataNotification';



@Injectable({
  providedIn: 'root',
})
export class NotificationService {

  constructor(private http: HttpClient) {
  }

  getListNotifications (): Observable<IDataNotification[]> {
    return this.http.get<IDataNotification[]>(environment.API_URL + '/get-log');
  }


}
