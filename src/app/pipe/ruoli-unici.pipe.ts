import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'ruoliUnici'
})
export class RuoliUniciPipe implements PipeTransform {

  transform(datiGiocatori: any[]): any[] {
    const ruoliUnici: any[] = [];
    for (const giocatore of datiGiocatori) {
      if (!ruoliUnici.includes(giocatore.ruolo)) {
        ruoliUnici.push(giocatore.ruolo);
      }
    }
    return ruoliUnici;
  }

}
