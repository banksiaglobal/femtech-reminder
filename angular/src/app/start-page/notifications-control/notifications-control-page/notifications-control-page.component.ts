import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { map, Observable } from 'rxjs';
import { IDataNotification } from 'src/app/models/IDataNotification';
import { NotificationService } from 'src/app/services/notifications.service';


@Component({
  selector: 'app-notifications-control-page',
  templateUrl: './notifications-control-page.component.html',
  styleUrls: ['./notifications-control-page.component.scss']
})
export class NotificationsControlPageComponent implements OnInit {

  public listNotifications$:  Observable<IDataNotification[]>;

  private userName: string;


  constructor(private notificationService: NotificationService, private route: ActivatedRoute) { }

  ngOnInit(): void {
  this.userName = this.route.snapshot.paramMap.get('user');
  this.setListNotifications();
  }

  setListNotifications():Observable<IDataNotification[]>  {
  this.listNotifications$ =  this.notificationService.findNotificationsByUserName(this.userName);
  return this.listNotifications$;
}

  onChangeState(id: string) {   
    // this.notificationsList.map(el => {
    //   if (el.id === id) el.state = !el.state;
    // });
  }


}