import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpClient } from '@angular/common/http';
import { IDataRecomendationByAge } from '../models/lDataRecomendationsByAge';



@Injectable({
  providedIn: 'root',
})
export class REcomendationsService {

  constructor(private http: HttpClient) {
  }

  getListRecomendationsByAge (): Observable<IDataRecomendationByAge[]> {
    return this.http.get<IDataRecomendationByAge[]>(environment.API_URL + '/recommendation-age');
  }
}
