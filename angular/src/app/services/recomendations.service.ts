import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpClient } from '@angular/common/http';
import { IDataRecomendationByAge } from '../models/lDataRecomendationsByAge';
import { IDataRecommendationPregnancy } from '../models/IDataRecommendationsPregnancy';




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

  getListRecomendationsByPregnancy (): Observable<IDataRecommendationPregnancy[]> {
    return this.http.get<IDataRecommendationPregnancy[]>(environment.API_URL + '/recommendation-pregnancy');
  }

  postRecomendationPregnancy(recomendation: IDataRecommendationPregnancy): Observable<any> {
    return this.http.post<any>(environment.API_URL + '/recommendation-pregnancy', recomendation);
  }
}
