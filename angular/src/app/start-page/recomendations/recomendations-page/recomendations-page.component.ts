import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { Observable, map } from 'rxjs';
import { IDataRecomendationByAge } from 'src/app/models/lDataRecomendationsByAge';
import { REcomendationsService } from 'src/app/services/recomendations.service';
import { RecomendationsFormComponent } from '../recomendations-form/recomendations-form.component';

@Component({
  selector: 'app-recomendations-page',
  templateUrl: './recomendations-page.component.html',
  styleUrls: ['./recomendations-page.component.scss'],
  standalone: true,
  imports:[CommonModule, RecomendationsFormComponent]
})
export class RecomendationsPageComponent implements OnInit {
  public listRecomendations$!: Observable<IDataRecomendationByAge[]>;

  constructor(private recomendationsService: REcomendationsService) { }

  ngOnInit(): void {
    this.listRecomendations$ = this.recomendationsService.getListRecomendationsByAge().pipe(map(data => {
      return data ?? [];
    }));
  }

  createNewRecomendation(){
    alert('create!')
  }

}
