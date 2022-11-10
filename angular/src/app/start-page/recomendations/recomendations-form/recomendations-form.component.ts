import { CommonModule } from '@angular/common';
import { Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { IDataRecomendationByAge } from 'src/app/models/lDataRecomendationsByAge';


@Component({
  selector: 'app-recomendations-form',
  templateUrl: './recomendations-form.component.html',
  styleUrls: ['./recomendations-form.component.scss'],
  standalone: true,
  imports: [CommonModule, MatCardModule]
})
export class RecomendationsFormComponent implements OnInit, OnChanges {

  @Input()data: IDataRecomendationByAge[];

  @Output() createNewRecomendation:EventEmitter<any> = new EventEmitter();

  public recomendation: IDataRecomendationByAge;

  constructor() { }
  ngOnChanges(changes: SimpleChanges): void {
    if (changes['data'].currentValue) {
      this.data = changes['data'].currentValue.recommendations;
    
    }
  }

  ngOnInit(): void {
  this.recomendation = {id:'24',description: "test old",
  source: "VOZ",
  ageFrom: 90,
  ageUpTo: 95,
  period: "1"};
  }

  createRecomendation(){
    this.createNewRecomendation.emit(this.recomendation);
  }

  

}
