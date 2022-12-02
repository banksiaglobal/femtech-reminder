import { Pipe, PipeTransform } from '@angular/core';

@Pipe ({
  name: 'textTransform',
  pure: true,
  standalone: true

})
export class TextTransform implements PipeTransform {
  transform(value: string, prefix: string ):string {
   value =  !value ? prefix : value;
   return value;
  }

}