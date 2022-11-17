import { Component, OnInit } from '@angular/core';
import { RecommendationsPregnancyFormComponent } from '../recommendations-pregnancy-form/recommendations-pregnancy-form.component';

@Component({
  selector: 'app-recommendations-pregnancy-page',
  templateUrl: './recommendations-pregnancy-page.component.html',
  styleUrls: ['./recommendations-pregnancy-page.component.scss'],
  standalone: true,
  imports: [RecommendationsPregnancyFormComponent]
})
export class RecommendationsPregnancyPageComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

}
