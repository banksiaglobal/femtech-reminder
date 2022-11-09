import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: 'overview',
    loadChildren: () => import('./start-page/start-page-table/start-page-table.module').then(m=>m.StartPageTableModule),
    pathMatch:'full',
    title: 'Overview'
  },
  {
    path: 'notifications-control',
    loadChildren: () => import('./start-page/notifications-control/notifications-control.module').then(m=>m.NotificationsControlModule),
    pathMatch:'full',
    title: 'Notifications'
  },
  {
    path: 'recomendations',
    loadComponent: () => import('./start-page/recomendations/recomendations-page/recomendations-page.component').then(m=>m.RecomendationsPageComponent),
    pathMatch:'full',
    title: 'Recomendations'
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
