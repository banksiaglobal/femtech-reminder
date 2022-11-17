import { CommonModule } from '@angular/common';
import { Component, EventEmitter, Input, Output, SimpleChanges } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { IDataRecommendationPregnancy } from 'src/app/models/IDataRecommendationsPregnancy';

@Component({
  selector: 'app-recommendations-pregnancy-form',
  templateUrl: './recommendations-pregnancy-form.component.html',
  styleUrls: ['./recommendations-pregnancy-form.component.scss'],
  standalone: true,
  imports: [CommonModule, MatCardModule, MatProgressSpinnerModule]
})
export class RecommendationsPregnancyFormComponent {
  @Input()data: IDataRecommendationPregnancy[];

  @Output() createNewRecomendation:EventEmitter<any> = new EventEmitter();

  constructor() { }

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['data'].currentValue) {
      this.data = changes['data'].currentValue.recommendations;    
    }
  }
  
  createRecomendation() {
    this.createNewRecomendation.emit();
  }

}
