import { Component, EventEmitter, Input, OnChanges, Output, SimpleChanges} from '@angular/core';

@Component({
  selector: 'app-notifications-control-form',
  templateUrl: './notifications-control-form.component.html',
  styleUrls: ['./notifications-control-form.component.scss']
})
export class NotificationsControlFormComponent  implements OnChanges{
  @Input() data!: any[];

  @Output() changeState: EventEmitter<string> = new EventEmitter<string>();

  public isEmptyData: boolean;


  ngOnChanges(changes: SimpleChanges): void {
    if (changes['data'].currentValue) {
      (changes['data'].currentValue).length === 0 ? this.isEmptyData = true : false;
      this.data = changes['data'].currentValue;   
    }
  }
  createNotifications(){

  }
}
