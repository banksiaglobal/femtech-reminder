import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { DataUser } from '../start-page-table-page/start-page-table-page.component';

@Component({
  selector: 'app-start-page-component-table',
  templateUrl: './start-page-component-table.component.html',
  styleUrls: ['./start-page-component-table.component.scss']
})
export class StartPageComponentTableComponent implements OnInit {
  @Input() data!: DataUser[];

  @ViewChild(MatPaginator) paginator!: MatPaginator;

  dataSource!: MatTableDataSource<DataUser>;

  displayedColumns: string[] = ['name','dob'];



  constructor() { }

  ngOnInit(): void {
    if (this.data.length > 0) {
      this.dataSource = new MatTableDataSource<DataUser>(this.data);
    }
  }

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
  }
}
