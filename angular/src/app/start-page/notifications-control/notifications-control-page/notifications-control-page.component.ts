import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import {  Observable } from 'rxjs';
import { IDataNotification } from 'src/app/models/IDataNotification';
import { IDataUser } from 'src/app/models/users';
import { NotificationService } from 'src/app/services/notifications.service';
import { UsersService } from 'src/app/services/users.service';


@Component({
  selector: 'app-notifications-control-page',
  templateUrl: './notifications-control-page.component.html',
  styleUrls: ['./notifications-control-page.component.scss']
})
export class NotificationsControlPageComponent implements OnInit {

  public listNotifications$:  Observable<IDataNotification[]>;
  
  private userName: string;

  public user$: Observable<IDataUser>;

 


  constructor(private notificationService: NotificationService, private userService: UsersService, private route: ActivatedRoute) { }

  ngOnInit(): void {
  this.userName = this.route.snapshot.paramMap.get('user');
  this.setUser();
  this.setListNotifications();
  }

  setUser (): Observable<IDataUser>{
    this.user$ = this.userService.getUserByUserName(this.userName);
    return this.user$;
  }

  setListNotifications():Observable<IDataNotification[]>  {
  this.listNotifications$ =  this.notificationService.findNotificationsByUserName(this.userName);
  return this.listNotifications$;
}
}