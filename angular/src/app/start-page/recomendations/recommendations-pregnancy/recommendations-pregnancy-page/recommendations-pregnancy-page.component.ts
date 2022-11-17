import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { filter, switchMap, tap, catchError, of, Observable, map } from 'rxjs';
import { IDataRecommendationPregnancy } from 'src/app/models/IDataREcommendationsPregnancy';
import { IDataRecomendationByAge } from 'src/app/models/lDataRecomendationsByAge';
import { RecomendationsService } from 'src/app/services/recomendations.service';
import { CreateRecomendationComponent } from '../../dialogs/create-recomendation/create-recomendation.component';
import { MessageDialogComponent } from '../../dialogs/message-dialog/message-dialog.component';
import { RecommendationsPregnancyFormComponent } from '../recommendations-pregnancy-form/recommendations-pregnancy-form.component';

@Component({
  selector: 'app-recommendations-pregnancy-page',
  templateUrl: './recommendations-pregnancy-page.component.html',
  styleUrls: ['./recommendations-pregnancy-page.component.scss'],
  standalone: true,
  imports: [RecommendationsPregnancyFormComponent, CommonModule, CreateRecomendationComponent, MatDialogModule]
})
export class RecommendationsPregnancyPageComponent implements OnInit {
  public listRecomendations$!: Observable<IDataRecommendationPregnancy[]>;

  constructor(private recomendationsService: RecomendationsService, private dialog: MatDialog) { }

  ngOnInit(): void {
    this.setListRecomendation(); 
  }

  setListRecomendation(): void {
    this.listRecomendations$ = this.recomendationsService.getListRecomendationsByPregnancy().pipe(map(data => {
      return data ?? [];
    }));
  }

  createNewRecomendation(recommendation:IDataRecommendationPregnancy): any{   
    const dialogRef =  this.dialog.open(CreateRecomendationComponent, 
      {enterAnimationDuration:'500ms',
       exitAnimationDuration:'500ms',
      data: recommendation});
    return dialogRef.afterClosed().pipe(filter(response=> response),
    switchMap(data=> this.recomendationsService.postRecomendation(data)),
    tap(()=> this.dialog.open(MessageDialogComponent)),
    tap(()=> this.setListRecomendation()),
    catchError(() =>
        of(alert("Something went wrong. Recomendation wasn't created/updated. Repeat the action.")),
      ),
    ).subscribe();
    }   

}
