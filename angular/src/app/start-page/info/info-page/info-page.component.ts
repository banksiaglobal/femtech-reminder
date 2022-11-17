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
    {title: 'to get a list of age recommendations', content:'click "Recommendations -> "age" in the header-menu'},
    {title: 'to get a list of recommendations for pregnancy', content:'click "Recommendations -> "pregnancy" in the header-menu'},
    {title: 'to create a new / correct of age recommendation', content:'click plus on the Recommendations age page'},
    {title: 'to create a new / correct of recommendation for pregnancy', content:'click plus on the Recommendations for pregnancy page'}
  ]
  }

}
