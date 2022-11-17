import { Component, OnInit, Inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import {MatDialog, MatDialogRef, MatDialogModule, MAT_DIALOG_DATA} from '@angular/material/dialog';
import {MatButtonModule} from '@angular/material/button';
import {MatCardModule} from '@angular/material/card';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatInputModule} from '@angular/material/input';
import { FormGroup, FormControl, FormsModule, ReactiveFormsModule,  Validators } from '@angular/forms';



@Component({
  selector: 'app-create-recomendation',
  templateUrl: './create-recomendation.component.html',
  styleUrls: ['./create-recomendation.component.scss'],
  standalone: true,
  imports: [CommonModule, MatCardModule, MatDialogModule, MatButtonModule, MatFormFieldModule, MatInputModule, FormsModule, ReactiveFormsModule]
})
export class CreateRecomendationComponent implements OnInit  {

  public recomendationForm: FormGroup;

  constructor(public dialog: MatDialog,  public dialogRef: MatDialogRef<CreateRecomendationComponent>,
    @Inject(MAT_DIALOG_DATA)
    public data: any) {}

    ngOnInit():void {  
   this.recomendationForm = new FormGroup({             
      "id": new FormControl('', Validators.required),
      "description": new FormControl('', Validators.required),
      "source": new FormControl('', Validators.required),
      "ageFrom": new FormControl(),
      "ageUpTo": new FormControl(),
      "period": new FormControl('', Validators.required),
  });
  }

  saveNewRecomendations(): void{
    if(this.recomendationForm.valid){    
      this.data = this.recomendationForm.value;      
      this.dialogRef.close(this.data);
    }   
  }

}
