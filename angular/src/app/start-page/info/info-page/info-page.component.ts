import { Component, OnInit } from '@angular/core';
import { InfoFormComponent } from '../info-form/info-form.component';

@Component({
  selector: 'app-info-page',
  templateUrl: './info-page.component.html',
  styleUrls: ['./info-page.component.scss'],
  standalone: true,
  imports: [InfoFormComponent]
})
export class InfoPageComponent implements OnInit {

  public listFeatures: {title: string, content: string}[];
  constructor() { }

  ngOnInit(): void {
    this.listFeatures = [{title:'to get a list of registered at this chat-bot', content: 'click "Users" header-menu'},
    {title: 'to get a list of notifications for any user at the list', content:'click "UserName" in the list of users'},
    {title: 'to get a list of recommendations ', content:'click "Recommendations" in the header-menu'},
    {title: 'to create a new recommendation', content:'click plus on the Recommendations page'}
  ]
  }

}
