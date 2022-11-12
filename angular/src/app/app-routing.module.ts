import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: 'users',
    loadComponent: () => import('./start-page/start-page-table/start-page-table-page/start-page-table-page.component').then(m=>m.StartPageTablePageComponent),
    pathMatch:'full',
    title: 'Users'
  },
  {
    path: 'notifications/:user',
    loadChildren: () => import('./start-page/notifications-control/notifications-control.module').then(m=>m.NotificationsControlModule),
    pathMatch:'full',
    title: 'Notifications'
  },
  {
    path: 'recommendations',
    loadComponent: () => import('./start-page/recomendations/recomendations-page/recomendations-page.component').then(m=>m.RecomendationsPageComponent),
    pathMatch:'full',
    title: 'Recomendations'
  },
  {
    path: 'info',
    loadComponent: () => import('./start-page/info/info-page/info-page.component').then(m=>m.InfoPageComponent),
    pathMatch:'full',
    title: 'Info'
  },
  {
      path: '',
      redirectTo: 'info',
      pathMatch: 'full',
  },
  {
    path: '**',
    redirectTo: 'info',
    pathMatch: 'full',
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
