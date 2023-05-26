import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { QueryComponent } from './components/query/query.component';

const routes: Routes = [
  {path:'Home', component: HomeComponent },
  {path:'Query', component: QueryComponent },
  {path: '', redirectTo: 'Home', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
