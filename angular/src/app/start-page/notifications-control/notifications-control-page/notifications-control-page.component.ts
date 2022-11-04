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
      description: 'Some description for notification',
      state: true,
    },
    {
      id: '2',
      title: 'Notification Type 2',
      description: 'Some description for notification',
      state: true,
    },
    {
      id: '3',
      title: 'Notification Type 3',
      description: 'Some description for notification and some description for notification and some description for notification',
      state: false,
    },
    {
      id: '4',
      title: 'Notification Type 4',
      description: 'Some description for notification and some description for notification',
      state: true,
    },
    {
      id: '5',
      title: 'Notification Type 5',
      description: 'Some description for notification',
      state: false,
    },
  ]

  constructor() { }

  ngOnInit(): void {
  }

  onChangeState(id: string) {
    this.notificationsList.map(el => {
      if (el.id === id) el.state = !el.state;
    });
  }
}
