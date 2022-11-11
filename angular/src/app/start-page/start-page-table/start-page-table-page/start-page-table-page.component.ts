import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatTableModule } from '@angular/material/table';
import { map, Observable} from 'rxjs';
import { IDataUser } from 'src/app/models/users';
import { UsersService } from 'src/app/services/users.service';
import { StartPageComponentTableComponent } from '../start-page-table/start-page-component-table.component';


@Component({
  selector: 'app-start-page-table-page',
  templateUrl: './start-page-table-page.component.html',
  styleUrls: ['./start-page-table-page.component.scss'],
  standalone: true,
  imports: [CommonModule, MatTableModule, MatPaginatorModule, MatProgressSpinnerModule, StartPageComponentTableComponent]

})
export class StartPageTablePageComponent implements OnInit {
  public listUsers$!: Observable<IDataUser[]>;

  constructor(private userService: UsersService) {
  }

  ngOnInit(): void {
    this.listUsers$ = this.userService.getListUsers().pipe(map(data => {
      return data ?? [];
    }));
  }

  swowInfoAboutUserNotifations(userName: string){
    console.log(userName);
  };

  chooseCurrentUser(userName: string):void {
    this.swowInfoAboutUserNotifations(userName);   
  }
}
