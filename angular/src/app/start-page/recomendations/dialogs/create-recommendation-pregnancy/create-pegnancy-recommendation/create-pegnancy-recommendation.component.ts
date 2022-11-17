import { CommonModule } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatDialog, MatDialogModule, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { CreateRecomendationComponent } from '../../create-recomendation/create-recomendation.component';

@Component({
  selector: 'app-create-pegnancy-recommendation',
  templateUrl: './create-pegnancy-recommendation.component.html',
  styleUrls: ['./create-pegnancy-recommendation.component.scss'],
  standalone: true,
  imports:[CommonModule, MatCardModule, MatDialogModule, MatInputModule, MatButtonModule, MatFormFieldModule, FormsModule, ReactiveFormsModule]
})
export class CreatePegnancyRecommendationComponent implements OnInit {

  public recomendationForm: FormGroup;

  constructor(public dialog: MatDialog,  public dialogRef: MatDialogRef<CreateRecomendationComponent>,
    @Inject(MAT_DIALOG_DATA)
    public data: any) {}

    ngOnInit():void {  
   this.recomendationForm = new FormGroup({             
      "description": new FormControl('', Validators.required),
      "source": new FormControl('', Validators.required),
       "week": new FormControl('', Validators.required),
  });
  }

  saveNewRecomendations(): void{
    if(this.recomendationForm.valid){    
      this.data = this.recomendationForm.value;      
      this.dialogRef.close(this.data);
    }   
  }
}
