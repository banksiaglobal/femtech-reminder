import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: 'overview',
    loadChildren: () => import('./start-page/start-page-table/start-page-table.module').then(m=>m.StartPageTableModule),
    pathMatch:'full'
  },
  {
    path: 'notifications-control',
    loadChildren: () => import('./start-page/notifications-control/notifications-control.module').then(m=>m.NotificationsControlModule),
    pathMatch:'full'
  },
  {
      path: '',
      redirectTo: 'overview',
      pathMatch: 'full',
  },
  {
    path: '**',
    redirectTo: 'overview',
    pathMatch: 'full',
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
