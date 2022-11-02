import { Component, EventEmitter, Input, Output } from '@angular/core';

@Component({
  selector: 'app-notifications-control-form',
  templateUrl: './notifications-control-form.component.html',
  styleUrls: ['./notifications-control-form.component.scss']
})
export class NotificationsControlFormComponent {
  @Input() data!: any[];

  @Output() changeState: EventEmitter<boolean> = new EventEmitter<boolean>();
}
