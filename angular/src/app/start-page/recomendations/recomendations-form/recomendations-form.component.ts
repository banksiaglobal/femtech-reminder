import { CommonModule } from '@angular/common';
import { Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { IDataRecomendationByAge } from 'src/app/models/lDataRecomendationsByAge';


@Component({
  selector: 'app-recomendations-form',
  templateUrl: './recomendations-form.component.html',
  styleUrls: ['./recomendations-form.component.scss'],
  standalone: true,
  imports: [CommonModule, MatCardModule, MatProgressSpinnerModule]
})
export class RecomendationsFormComponent implements OnChanges {

  @Input()data: IDataRecomendationByAge[];

  @Output() createNewRecomendation:EventEmitter<any> = new EventEmitter();

  public recomendation: IDataRecomendationByAge;

  constructor() { }
  ngOnChanges(changes: SimpleChanges): void {
    if (changes['data'].currentValue) {
      this.data = changes['data'].currentValue.recommendations;
    
    }
  }
  createRecomendation(){

    this.createNewRecomendation.emit();
  }

  

}
