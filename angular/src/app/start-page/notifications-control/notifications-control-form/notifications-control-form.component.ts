import { Component, EventEmitter, Input, OnChanges, Output, SimpleChanges} from '@angular/core';
import { IDataNotification } from 'src/app/models/IDataNotification';
import { IDataUser } from 'src/app/models/users';

@Component({
  selector: 'app-notifications-control-form',
  templateUrl: './notifications-control-form.component.html',
  styleUrls: ['./notifications-control-form.component.scss']
})
export class NotificationsControlFormComponent  implements OnChanges {
  @Input() data!: IDataNotification[];

  @Input() user!: IDataUser;

  public isEmptyData: boolean;

  public userName: string;

  public telegram: number;

  
  ngOnChanges(changes: SimpleChanges): void {
    if (this.data && changes['data']) {
      (changes['data'].currentValue).length === 0 ? this.isEmptyData = true : false;
      this.data = changes['data'].currentValue;   
     }
    

    if (this.user && changes['user']){
      if (changes['user'].currentValue !== changes['user'].previousValue) {
        this.userName = changes['user'].currentValue.name;
        const telegramID:number = (changes['user'].currentValue.telegramID);
        this.telegram = telegramID;
      }
      
    }
   
  }
}