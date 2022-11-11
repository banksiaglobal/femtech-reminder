import { CommonModule } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatTableModule } from '@angular/material/table';
import { CreateRecomendationComponent } from 'src/app/start-page/recomendations/dialogs/create-recomendation/create-recomendation.component';

@Component({
  selector: 'app-extra-user-info',
  templateUrl: './extra-user-info.component.html',
  styleUrls: ['./extra-user-info.component.scss'],
  standalone: true,
  imports: [CommonModule, MatTableModule, MatPaginatorModule, MatProgressSpinnerModule]
})
export class ExtraUserInfoComponent implements OnInit {

  constructor(public dialog: MatDialog,  public dialogRef: MatDialogRef<CreateRecomendationComponent>,
    @Inject(MAT_DIALOG_DATA)
    public data: any) {}
    ngOnInit(): void {
  }

}
