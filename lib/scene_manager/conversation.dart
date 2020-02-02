import 'message.dart';

class Conversation {
  Conversation({
    this.charactorId,
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
  
  String charactorId;
  String emotion;
  List<Message> messages;
}