import { CommonModule } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import {MatListModule} from '@angular/material/list';
import {MatIconModule} from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { Router } from '@angular/router';

@Component({
  selector: 'app-info-form',
  templateUrl: './info-form.component.html',
  styleUrls: ['./info-form.component.scss'],
  standalone: true,
  imports: [CommonModule, MatCardModule, MatListModule, MatIconModule, MatButtonModule]
})
export class InfoFormComponent implements OnInit {

  @Input()listFeatures: {title: string, content: string}[];

  constructor(private router: Router) { }

  ngOnInit(): void {
  }

  goToDemo(): void {
    this.router.navigate(['/demo']);
  }

}
