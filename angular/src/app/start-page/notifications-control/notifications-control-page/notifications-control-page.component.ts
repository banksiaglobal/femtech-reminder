import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-notifications-control-page',
  templateUrl: './notifications-control-page.component.html',
  styleUrls: ['./notifications-control-page.component.scss']
})
export class NotificationsControlPageComponent implements OnInit {
  notificationsList: any[] = [
    {
      id: '1',
      title: 'Notification Type 1',
      state: true,
    },
    {
      id: '2',
      title: 'Notification Type 2',
      state: true,
    },
    {
      id: '3',
      title: 'Notification Type 3',
      state: false,
    },
    {
      id: '4',
      title: 'Notification Type 4',
      state: true,
    },
    {
      id: '5',
      title: 'Notification Type 5',
      state: false,
    },
  ]

  constructor() { }

  ngOnInit(): void {
  }

  onChangeState(event: any) {
    console.log(event);
  }
}
