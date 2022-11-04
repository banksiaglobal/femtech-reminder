import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpClient } from "@angular/common/http";
import { IDataUser } from '../models/users';


@Injectable({
  providedIn: 'root'
})
export class UsersService {

  constructor( private http: HttpClient) { }

 getListUsers(): Observable<IDataUser[]>{   
 return this.http.get<IDataUser[]>(environment.API_URL);
}
}
