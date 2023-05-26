import { Component } from '@angular/core';
import { ConnectionDBService } from 'src/app/services/connection-db.service';

@Component({
  selector: 'app-query',
  templateUrl: './query.component.html',
  styleUrls: ['./query.component.css']
})
export class QueryComponent {

  selectedOption!: string;

  datiSquadre: any;
  datiGiocatori: any;

  cittaGiocatore!: String;

  datiGiocatorePerCitta: any;

  allenatore!: String;

  datiSquadraGiocatoriPerAllenatore: any;

  dataPartita!: String;

  datiPartitaPerData: any;

  ruoloGiocatore!: String;

  datiGiocatoriRuolo: any;

  etaGiocatore!: Number;

  datiGiocatoriPerEta: any;

  gironeSquadra!: Number;

  datiSquadrePerGirone: any;

  blocks: any[] = [
    { value: '1', label: 'Visualizzare l’elenco delle squadre'},
    { value: '2', label: 'Visualizzare tutti i giocatori'},
    { value: '3', label: 'Visualizzare tutti i giocatori di una data città'},
    { value: '4', label: 'Dato un allenatore, visualizzare la squadra che allena e i giocatori che ne fanno parte'},
    { value: '5', label: 'Visualizzare, in una certa data, le partite che sono state giocate specificandone: girone, numero, giornata e squadre coinvolte'},
    { value: '6', label: 'Dato un ruolo, visualizzare tutti i giocatori che hanno quel ruolo in comune'},
    { value: '7', label: 'Visualizzare tutti i calciatori che hanno più di 24 anni'},
    { value: '8', label: 'Visualizzare tutte le squadre che hanno giocato in casa in un determinato girone'},
  ];

  constructor(private http: ConnectionDBService) { }

  ngOnInit(): void {
    this.ricercaGiocatori();
    this.ricercaSquadre();
  }

  ricercaSquadre() {
    this.http.ricerca1().subscribe(data => {
      this.datiSquadre = data;
    });
  }

  ricercaGiocatori() {
    this.http.ricerca2().subscribe(data => {
      this.datiGiocatori = data;
    });
  }

  ricercaGiocatorePerCitta(cittaGiocatore: String) {
    this.http.ricerca3(cittaGiocatore).subscribe(data => {
      this.datiGiocatorePerCitta = data;
    });
  }

  ricercaSquadraGiocatoriPerAllenatore(allenatore: String) {
    this.http.ricerca4(allenatore).subscribe(data => {
      this.datiSquadraGiocatoriPerAllenatore = data;
    });
  }

  ricercaPartitaPerData(dataPartita: String) {
    this.http.ricerca5(dataPartita).subscribe(data => {
      this.datiPartitaPerData = data;
    });
  }

  ricercaRuoloGiocatore(ruoloGiocatore: String) {
    this.http.ricerca6(ruoloGiocatore).subscribe(data => {
      this.datiGiocatoriRuolo = data;
    });
  }

  ricercaGiocatorePerEta(etaGiocatore: Number) {
    this.http.ricerca7(etaGiocatore).subscribe(data => {
      this.datiGiocatoriPerEta = data;
    });
  }

  calcolaEta(dataNascita: string): number {
    const oggi = new Date();
    const dataNascitaCompleta = new Date(dataNascita);
    let eta = oggi.getFullYear() - dataNascitaCompleta.getFullYear();
    const meseAttuale = oggi.getMonth();
    const meseNascita = dataNascitaCompleta.getMonth();
    if (meseAttuale < meseNascita || (meseAttuale === meseNascita && oggi.getDate() < dataNascitaCompleta.getDate())) {
      eta--;
    }
    return eta;
  }

  ricercaSquadrePerGirone(gironeSquadra:Number){
    this.http.ricerca8(gironeSquadra).subscribe(data => {
      this.datiSquadrePerGirone = data;
    });
  }
}
