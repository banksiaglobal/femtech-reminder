import { CommonModule } from '@angular/common';
import { AfterViewInit, Component, EventEmitter, Input, OnChanges, Output, SimpleChanges, ViewChild } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatPaginator, MatPaginatorModule } from '@angular/material/paginator';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { IDataUser } from 'src/app/models/users';


@Component({
  selector: 'app-start-page-component-table',
  templateUrl: './start-page-component-table.component.html',
  styleUrls: ['./start-page-component-table.component.scss'],
  standalone: true,
  imports: [CommonModule, MatCardModule, MatProgressSpinnerModule, MatTableModule, MatPaginatorModule, MatProgressSpinnerModule]
})
export class StartPageComponentTableComponent implements OnChanges, AfterViewInit {
  @Input() data: IDataUser[];

  @Output() chooseCurrentUser: EventEmitter<any> = new EventEmitter();

  dataSource = new MatTableDataSource<IDataUser>();

  @ViewChild(MatPaginator) paginator: MatPaginator;

  displayedColumns: string[] = ['name', 'lastName', 'birthdayDate', 'telegramID'];

  constructor() {
  }

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['data'].currentValue) this.dataSource.data = changes['data'].currentValue.patients;
  }

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
  }


  chooseUser(event){   
    this.chooseCurrentUser.emit(event.target.innerHTML);

  }
}
