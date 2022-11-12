import { Injectable } from '@angular/core';
import { map, Observable, shareReplay } from 'rxjs';
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
    return this.http.get<IDataNotification[]>(environment.API_URL + '/get-log').pipe(shareReplay());
  }

  findNotificationsByUserName(userName: string): Observable<IDataNotification[]> {
    // console.log(this.getListNotifications().pipe(map(data=> data['notifications'].find(el=> el.patient == userName))).subscribe(data=> console.log(data)))
   return this.getListNotifications().pipe(map(data=> data['notifications'].filter(el=> el.patient == userName)));
  }


}
