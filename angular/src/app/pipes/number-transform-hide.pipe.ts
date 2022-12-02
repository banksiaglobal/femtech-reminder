import { Pipe, PipeTransform } from '@angular/core';

@Pipe ({
  name: 'numberTransformHide',
  pure: true,
  standalone: true

})
export class NumberTransformHide implements PipeTransform {
  transform(value: number, prefix: string ): string {   
   return value ?  String(value).replace( /./gm, '*').slice(4) + String(value).slice(-4) : prefix;
  }
}