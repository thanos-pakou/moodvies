export class User {

  constructor()
  constructor(id: number, username: string, email: string, first_name: string, last_name: string)
  constructor(id: number, username: string, email: string, password: string, first_name: string, last_name: string)
  constructor(id?: number, username?: string, email?: string, password?: string, first_name?: string, last_name?: string) {
    this.id = id;
    this.username = username;
    this.email = email;
    this.password = password;
    this.first_name = first_name;
    this.last_name = last_name;
  }



  id: number;
  username: string;
  email: string;
  password: string;
  first_name: string;
  last_name: string;
}
