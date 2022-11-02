import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { StartPageModule } from './start-page/start-page/start-page.module';

export const routes: Routes = [
  {
    path: 'overview',
    loadChildren: () => import('./start-page/start-page/start-page.module').then(m=>m.StartPageModule),
    pathMatch:'full'
    
  },
  {
    
      path: '',
      redirectTo: '/overview',
      pathMatch: 'full',
    
  }

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
