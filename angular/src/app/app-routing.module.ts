import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DemoComponent } from './start-page/demo/demo.component';

export const routes: Routes = [  
  {
    path: 'demo',
    loadComponent:() => import('./start-page/demo/demo.component').then(m=>m.DemoComponent),
    pathMatch: 'full',
    title: 'demo'
  },
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
    path: 'recommendations-age',
    loadComponent: () => import('./start-page/recomendations/recommendations-age/recomendations-page/recomendations-age-page.component').then(m=>m.RecomendationsAgePageComponent),
    pathMatch:'full',
    title: 'Age recomendations'
  },
  {
    path: 'recommendations-pregnancy',
    loadComponent: () => import('./start-page/recomendations/recommendations-pregnancy/recommendations-pregnancy-page/recommendations-pregnancy-page.component').then(m=>m.RecommendationsPregnancyPageComponent),
    pathMatch:'full',
    title: 'Pregnancy recomendations'
  },
  {
    path: 'info',
    loadComponent: () => import('./start-page/info/info-page/info-page.component').then(m=>m.InfoPageComponent),
    pathMatch:'full',
    title: 'Info'
  },
  {
      path: '',
      redirectTo: 'demo',
      pathMatch: 'full',
  },
  {
    path: '**',
    redirectTo: 'demo',
    pathMatch: 'full',
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
