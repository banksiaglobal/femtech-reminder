import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { MatDialogRef, MatDialog, MatDialogModule } from '@angular/material/dialog';
import { Observable, map } from 'rxjs';
import { IDataRecomendationByAge } from 'src/app/models/lDataRecomendationsByAge';
import { RecomendationsService } from 'src/app/services/recomendations.service';
import { CreateRecomendationComponent } from '../dialogs/create-recomendation/create-recomendation.component';
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
      this.listRecomendations$ = this.recomendationsService.getListRecomendationsByAge().pipe(map(data => {
      return data ?? [];
    }));
  }

  createNewRecomendation(recomendation:IDataRecomendationByAge){
    console.log(recomendation);
    this.dialog.open(CreateRecomendationComponent);
    // this.recomendationsService.postRecomendation(recomendation).subscribe();
  }

}
