import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpClient } from '@angular/common/http';
import { IDataRecomendationByAge } from '../models/lDataRecomendationsByAge';



@Injectable({
  providedIn: 'root',
})
export class RecomendationsService {

  constructor(private http: HttpClient) {
  }

  getListRecomendationsByAge (): Observable<IDataRecomendationByAge[]> {
    return this.http.get<IDataRecomendationByAge[]>(environment.API_URL + '/recommendation-age');
  }

  postRecomendation(recomendation: IDataRecomendationByAge): Observable<any> {
    return this.http.post<any>(environment.API_URL + '/recommendation-age', recomendation);
  }
}