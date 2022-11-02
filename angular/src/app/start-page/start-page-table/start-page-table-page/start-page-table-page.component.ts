import { Component, OnInit } from '@angular/core';

export interface DataUser {
  name: string;
  dob: string;
}

@Component({
  selector: 'app-start-page-table-page',
  templateUrl: './start-page-table-page.component.html',
  styleUrls: ['./start-page-table-page.component.scss'],
})
export class StartPageTablePageComponent implements OnInit {

  public listUsers: DataUser[] = [
    { name: 'Hydrogen', dob: '12/01/1988' },
    { name: 'Helium', dob: '12/01/1988' },
    { name: 'Lithium', dob: '12/01/1988' },
    { name: 'Beryllium', dob: '12/01/1988' },
    { name: 'Hydrogen', dob: '12/01/1988' },
    { name: 'Helium', dob: '12/01/1988' },
    { name: 'Lithium', dob: '12/01/1988' },
    { name: 'Beryllium', dob: '12/01/1988' },
  ];

  constructor() {
  }

  ngOnInit(): void {
  }

}
