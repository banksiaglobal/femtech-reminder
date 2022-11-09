import { Component, EventEmitter, Input, OnChanges, Output, SimpleChanges, ViewChild, AfterViewInit } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { INotificationByAge } from 'src/app/models/listNotificationsByAge';

@Component({
  selector: 'app-notifications-control-form',
  templateUrl: './notifications-control-form.component.html',
  styleUrls: ['./notifications-control-form.component.scss']
})
export class NotificationsControlFormComponent implements OnChanges, AfterViewInit {
  @Input() data: INotificationByAge[];

  @Output() changeState: EventEmitter<string> = new EventEmitter<string>();

  dataSource = new MatTableDataSource<INotificationByAge>();

  @ViewChild(MatPaginator) paginator: MatPaginator;

  displayedColumns: string[] = ['description', 'source', 'ageFrom', 'ageUpTo','period'];

  constructor() {
  }

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['data'].currentValue) this.dataSource.data = changes['data'].currentValue.recommendations;
  }

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
  }
}
