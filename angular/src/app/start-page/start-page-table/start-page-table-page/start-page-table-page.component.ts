import { CommonModule } from '@angular/common';
import { Component, OnChanges, OnInit, SimpleChanges } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatTableModule } from '@angular/material/table';
import { ActivatedRoute, Router } from '@angular/router';
import { map, Observable} from 'rxjs';
import { IDataUser } from 'src/app/models/users';
import { NotificationService } from 'src/app/services/notifications.service';
import { UsersService } from 'src/app/services/users.service';
import { StartPageComponentTableComponent } from '../start-page-table/start-page-component-table.component';


@Component({
  selector: 'app-start-page-table-page',
  templateUrl: './start-page-table-page.component.html',
  styleUrls: ['./start-page-table-page.component.scss'],
  standalone: true,
  imports: [CommonModule, MatCardModule, MatDialogModule, MatPaginatorModule, MatProgressSpinnerModule, StartPageComponentTableComponent]

})
export class StartPageTablePageComponent implements OnInit {
  public listUsers$!: Observable<IDataUser[]>;

  public notificationCurrentUser: any;

  constructor(private userService: UsersService, private router: Router) {
  }

  ngOnInit(): void {
    this.listUsers$ = this.userService.getListUsers().pipe(map(data => {
      return data ?? [];
    }));
  }

  chooseCurrentUser(userName: string):void {
  this.router.navigate(['/notifications', userName])  ;
  }
}
