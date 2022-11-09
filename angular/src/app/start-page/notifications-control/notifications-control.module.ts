import { NgModule } from '@angular/core';
import { NotificationsControlPageComponent } from './notifications-control-page/notifications-control-page.component';
import { NotificationsControlFormComponent } from './notifications-control-form/notifications-control-form.component';
import { NotificationsControlRoutingModule } from './notifications-control-routing.module';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { CommonModule } from '@angular/common';
import { MatCardModule } from '@angular/material/card';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatTableModule } from '@angular/material/table';

@NgModule({
  declarations: [
    NotificationsControlPageComponent,
    NotificationsControlFormComponent
  ],
  imports: [CommonModule, MatSlideToggleModule, MatCardModule, MatPaginatorModule, MatTableModule],
  exports: [NotificationsControlRoutingModule],
})
export class NotificationsControlModule {}
