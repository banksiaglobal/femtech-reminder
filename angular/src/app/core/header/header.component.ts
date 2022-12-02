import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
})
export class HeaderComponent implements OnInit {

  constructor( private router: Router) { }

  ngOnInit(): void {
  }

  goToRecommedationsAge(){
    this.router.navigate(['/recommendations-age']);
  }

  goToRecommedationsPregnancy(){
    this.router.navigate(['/recommendations-pregnancy']);
  }

  goToInfo(){
    this.router.navigate(['/info']);
  }
  
  gotoUsers(){
    this.router.navigate(['/users']);
  }

}
