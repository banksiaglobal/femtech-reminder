import { Component, EventEmitter, Input, OnChanges, Output, SimpleChanges} from '@angular/core';
import { IDataNotification } from 'src/app/models/IDataNotification';

@Component({
  selector: 'app-notifications-control-form',
  templateUrl: './notifications-control-form.component.html',
  styleUrls: ['./notifications-control-form.component.scss']
})
export class NotificationsControlFormComponent  implements OnChanges{
  @Input() data!: IDataNotification[];

  @Input() userName: string;



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
