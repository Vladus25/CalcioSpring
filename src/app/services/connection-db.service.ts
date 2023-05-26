import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ConnectionDBService {

  private baseUrl = 'http://localhost:8080';

  constructor(private http: HttpClient) { }

  ricerca1(): Observable<any> {
    return this.http.get(`${this.baseUrl}/getSquadre`);
  }

  ricerca2(): Observable<any> {
    return this.http.get(`${this.baseUrl}/getGiocatori`);
  }

  ricerca3(citta: String): Observable<any> {
    return this.http.get(`${this.baseUrl}/giocatoreByCitta/${citta}`);
  }

  ricerca4(allenatore: String): Observable<any> {
    return this.http.get(`${this.baseUrl}/squadraByAllenatoreName/${allenatore}`);
  }

  ricerca5(data: String): Observable<any> {
    return this.http.get(`${this.baseUrl}/partiteBydata/${data}`);
  }

  ricerca6(ruolo: String): Observable<any> {
    return this.http.get(`${this.baseUrl}/giocatoriByRuolo/${ruolo}`);
  }

  ricerca7(eta: Number): Observable<any> {
    return this.http.get(`${this.baseUrl}/giocatoriAnni24/${eta}`);
  }

  ricerca8(girone: Number): Observable<any> {
    return this.http.get(`${this.baseUrl}/squadreIncasaByGirone/${girone}`);
  }
}
