import { AfterViewInit, Component, Input, OnChanges, SimpleChanges, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { IDataUser } from 'src/app/models/users';

@Component({
  selector: 'app-start-page-component-table',
  templateUrl: './start-page-component-table.component.html',
  styleUrls: ['./start-page-component-table.component.scss'],
})
export class StartPageComponentTableComponent implements OnChanges, AfterViewInit {
  @Input() data: IDataUser[];

  dataSource = new MatTableDataSource<IDataUser>();

  @ViewChild(MatPaginator) paginator: MatPaginator;

  displayedColumns: string[] = ['name', 'lastName', 'birthdayDate', 'telegramID'];

  constructor() {
  }

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['data'].currentValue) this.dataSource.data = changes['data'].currentValue;
  }

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
  }
}
