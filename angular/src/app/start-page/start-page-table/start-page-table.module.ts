import { NgModule } from '@angular/core';
import { StartPageTablePageComponent } from './start-page-table-page/start-page-table-page.component';
import { StartPageComponentTableComponent } from './start-page-table/start-page-component-table.component';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { StartPageTableRoutingModule } from './start-page-table-routing.module';
import { CommonModule } from '@angular/common';

@NgModule({
  declarations: [
    StartPageTablePageComponent,
    StartPageComponentTableComponent
  ],
  imports: [CommonModule, MatTableModule, MatPaginatorModule],
  exports: [StartPageTableRoutingModule],
})
export class StartPageTableModule {}
