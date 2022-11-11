import { Component, OnInit } from '@angular/core';
import { map, Observable} from 'rxjs';
import { IDataUser } from 'src/app/models/users';
import { UsersService } from 'src/app/services/users.service';


@Component({
  selector: 'app-start-page-table-page',
  templateUrl: './start-page-table-page.component.html',
  styleUrls: ['./start-page-table-page.component.scss'],

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
}
