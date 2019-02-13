import { Injectable } from '@angular/core';
import {MessageProfile} from "./message-profile";

@Injectable()
export class MessageService {

  messages: string[] = [];
  messagesProfile: MessageProfile;

  add(message: string) {
    this.messages.push(message);
  }

  addmessagesProfile(field: string, cont: string) {
    this.messagesProfile[field] = cont;
  }

  clear() {
    this.messages.length = 0;
  }

  clearmessagesProfile() {
    this.messagesProfile = null;
  }

  constructor() { }

}
