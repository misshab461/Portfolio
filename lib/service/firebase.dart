import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/models/user.dart';

class Service {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(UserMessage message) async {
    try {
      await _firestore.collection('messages').add(message.toMap());
    } catch (e) {
      print('Error sending message: $e');
    }
  }
}
