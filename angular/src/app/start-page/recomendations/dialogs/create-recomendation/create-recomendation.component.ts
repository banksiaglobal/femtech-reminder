import { Component, OnInit } from '@angular/core';
import {MatDialog, MatDialogRef} from '@angular/material/dialog';


@Component({
  selector: 'app-create-recomendation',
  templateUrl: './create-recomendation.component.html',
  styleUrls: ['./create-recomendation.component.scss'],
  standalone: true
})
export class CreateRecomendationComponent  {
  constructor(public dialog: MatDialog) {}

  openDialog(): void {
    this.dialog.open(CreateRecomendationComponent, {
      width: '250px',
    
    });
  }

}
