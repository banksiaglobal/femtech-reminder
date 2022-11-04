import { Component, Input, OnChanges, OnInit, SimpleChanges, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { IDataUser } from 'src/app/models/users';

@Component({
  selector: 'app-start-page-component-table',
  templateUrl: './start-page-component-table.component.html',
  styleUrls: ['./start-page-component-table.component.scss']
})
export class StartPageComponentTableComponent implements OnChanges, OnInit {
  @Input() data: IDataUser[] = [];

  @ViewChild(MatPaginator, {static: true}) paginator!: MatPaginator;

  dataSource: MatTableDataSource<IDataUser> = new MatTableDataSource<IDataUser>([]);

  displayedColumns: string[] = ['name','lastName','birthdayDate','telegramID' ];

  constructor() { }
  ngOnInit(): void {
  }
 
  ngOnChanges(changes: SimpleChanges): void {
    if (changes){
      this.dataSource = new MatTableDataSource<IDataUser>(this.data);    
    }
    console.log('onCheck')
  }
  

 
  ngAfterViewInit() {
    if (this.dataSource){
      console.log('ngAfterViewInit');
      this.dataSource.paginator = this.paginator;
    }
  

  }
}
