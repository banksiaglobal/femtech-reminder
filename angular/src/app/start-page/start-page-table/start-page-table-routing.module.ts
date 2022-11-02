import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { StartPageTablePageComponent } from './start-page-table-page/start-page-table-page.component';

export const routes: Routes = [
  {
      path: '',
      component: StartPageTablePageComponent
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class StartPageTableRoutingModule { }
