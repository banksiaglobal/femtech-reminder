import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StartPageComponentTableComponent } from './start-page-component/start-page-component-table/start-page-component-table.component';
import { StartPageRoutingModule } from './start-page-routing.module';
import { StartPageComponentComponent } from './start-page-component/start-page-component.component';
import {MatTableModule} from '@angular/material/table';
import {MatPaginatorModule} from '@angular/material/paginator';



@NgModule({
  declarations: [
     StartPageComponentTableComponent,
     StartPageComponentComponent
  ],
  imports: [
    CommonModule,
    StartPageRoutingModule,
    MatTableModule,
    MatPaginatorModule
    
  ]
})
export class StartPageModule { }
