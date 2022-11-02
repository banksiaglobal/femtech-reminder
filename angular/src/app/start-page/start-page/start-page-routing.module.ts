import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StartPageComponentComponent } from './start-page-component/start-page-component.component';

import { RouterModule, Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: '',
    component: StartPageComponentComponent,   
  },
];


@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class StartPageRoutingModule { }
