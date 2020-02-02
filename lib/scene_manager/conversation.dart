import 'message.dart';

class Conversation {
  Conversation({ this.charactorId, this.emotion, this.messages });
  
  final String charactorId;
  final String emotion;
  final List<Message> messages;
}