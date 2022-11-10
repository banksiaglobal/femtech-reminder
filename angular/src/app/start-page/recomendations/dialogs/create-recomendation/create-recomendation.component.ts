import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import {MatDialog, MatDialogRef, MatDialogModule} from '@angular/material/dialog';
import {MatButtonModule} from '@angular/material/button';
import {MatCardModule} from '@angular/material/card';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatInputModule} from '@angular/material/input';



@Component({
  selector: 'app-create-recomendation',
  templateUrl: './create-recomendation.component.html',
  styleUrls: ['./create-recomendation.component.scss'],
  standalone: true,
  imports: [CommonModule, MatCardModule, MatDialogModule, MatButtonModule, MatFormFieldModule, MatInputModule]
})
export class CreateRecomendationComponent  {
  constructor(public dialog: MatDialog) {}



}
