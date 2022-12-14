import { CommonModule } from '@angular/common';
import { AfterViewInit, ChangeDetectionStrategy, Component, EventEmitter, Input, OnChanges, Output, SimpleChanges, ViewChild } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatPaginator, MatPaginatorModule } from '@angular/material/paginator';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { IDataUser } from 'src/app/models/users';
import { NumberTransformHide } from 'src/app/pipes/number-transform-hide.pipe';
import {TextTransform} from 'src/app/pipes/text-transform.pipe';


@Component({
  selector: 'app-start-page-component-table',
  templateUrl: './start-page-component-table.component.html',
  styleUrls: ['./start-page-component-table.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush,
  standalone: true,
  imports: [CommonModule, MatCardModule, MatProgressSpinnerModule, MatTableModule, MatPaginatorModule, MatProgressSpinnerModule, TextTransform, NumberTransformHide]
})
export class StartPageComponentTableComponent implements OnChanges, AfterViewInit {
  @Input() data: IDataUser[];

  @Output() chooseCurrentUser: EventEmitter<any> = new EventEmitter();

  dataSource = new MatTableDataSource<IDataUser>();

  @ViewChild(MatPaginator) paginator: MatPaginator;

  displayedColumns: string[] = ['name', 'lastName', 'telegramID'];

  public userName: string;

  public isEmptyData: boolean;

  constructor() {
  }

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['data'].currentValue) {
      this.dataSource.data = changes['data'].currentValue;
      (changes['data'].currentValue).length === 0 ? this.isEmptyData = true : false;
    }
  }

  ngAfterViewInit(): void {
    this.dataSource.paginator = this.paginator;
  }

  chooseUser(event): void{   
    this.userName = event.target.innerHTML.trim();
    this.chooseCurrentUser.emit(this.userName);

  }
}
