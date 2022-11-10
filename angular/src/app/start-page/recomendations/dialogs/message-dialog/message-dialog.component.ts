import { CommonModule } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatDialog, MatDialogModule, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { CreateRecomendationComponent } from '../create-recomendation/create-recomendation.component';

@Component({
  selector: 'app-message-dialog',
  templateUrl: './message-dialog.component.html',
  styleUrls: ['./message-dialog.component.scss'],
  standalone: true,
  imports: [CommonModule, MatCardModule, MatDialogModule, MatButtonModule]

})
export class MessageDialogComponent implements OnInit {

  constructor(public dialog: MatDialog,  public dialogRef: MatDialogRef<CreateRecomendationComponent>,
    @Inject(MAT_DIALOG_DATA)
    public data: any) {}
    ngOnInit(): void {
  }

}
