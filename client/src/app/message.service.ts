import { Injectable } from '@angular/core';
import {MessageProfile} from "./message-profile";

@Injectable()
export class MessageService {

  messages: string[] = [];
  messagesProfile: string[] = [];

  add(message: string) {
    this.messages.push(message);
  }

  addMessagesProfile(message: string) {
    this.messagesProfile.push(message);
  }

  clear() {
    this.messages.length = 0;
  }

  clearMessagesProfile() {
    this.messagesProfile.length = 0;
  }

  constructor() { }

}
