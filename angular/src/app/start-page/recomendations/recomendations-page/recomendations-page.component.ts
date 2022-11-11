import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { MatDialogRef, MatDialog, MatDialogModule } from '@angular/material/dialog';
import { Observable, map, filter, catchError, tap, switchMap, of } from 'rxjs';
import { IDataRecomendationByAge } from 'src/app/models/lDataRecomendationsByAge';
import { RecomendationsService } from 'src/app/services/recomendations.service';
import { CreateRecomendationComponent } from '../dialogs/create-recomendation/create-recomendation.component';
import { MessageDialogComponent } from '../dialogs/message-dialog/message-dialog.component';
import { RecomendationsFormComponent } from '../recomendations-form/recomendations-form.component';

@Component({
  selector: 'app-recomendations-page',
  templateUrl: './recomendations-page.component.html',
  styleUrls: ['./recomendations-page.component.scss'],
  standalone: true,
  imports:[CommonModule, RecomendationsFormComponent, CreateRecomendationComponent, MatDialogModule]
})
export class RecomendationsPageComponent implements OnInit {
  public listRecomendations$!: Observable<IDataRecomendationByAge[]>;

  constructor(private recomendationsService: RecomendationsService, private dialog: MatDialog) { }

  ngOnInit(): void {
    this.setListRecomendation(); 
  }

  setListRecomendation(): void {
    this.listRecomendations$ = this.recomendationsService.getListRecomendationsByAge().pipe(map(data => {
      return data ?? [];
    }));

  }

  createNewRecomendation(recomendation:IDataRecomendationByAge): any{   
    const dialogRef =  this.dialog.open(CreateRecomendationComponent, 
      {enterAnimationDuration:'500ms',
       exitAnimationDuration:'500ms',
      data: recomendation});
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
  


