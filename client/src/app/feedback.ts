export class Feedback {
  constructor(email: string,
              content: string,
              ip_address: number,
  ) {
    this.email = email;
    this.content = content;
    this.ip_address = ip_address;
  }

  idFeedback: number;
  email: string;
  content: string;
  ip_address: number;
}
