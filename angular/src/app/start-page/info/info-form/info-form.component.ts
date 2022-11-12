import { CommonModule } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import {MatListModule} from '@angular/material/list';
import {MatIconModule} from '@angular/material/icon';

@Component({
  selector: 'app-info-form',
  templateUrl: './info-form.component.html',
  styleUrls: ['./info-form.component.scss'],
  standalone: true,
  imports: [CommonModule, MatCardModule, MatListModule, MatIconModule]
})
export class InfoFormComponent implements OnInit {

  @Input()listFeatures: {title: string, content: string}[];

  constructor() { }

  ngOnInit(): void {
  }

}
