import 'message.dart';

class Conversation {
  Conversation({
    this.characterId,
    this.emotion,
    messages
  }) {
    this.messages = messages.map<Message>((attrs) =>
      new Message(
        text: attrs['text'],
        conditions: attrs['conditions'].cast<String>(),
      )
    ).toList();
  }
  
  String characterId;
  String emotion;
  List<Message> messages;
}