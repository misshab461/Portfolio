part of 'firebase_bloc.dart';

@immutable
sealed class FirebaseEvent {}

class MessageButtonPressed extends FirebaseEvent {
  final UserMessage message;

  MessageButtonPressed({required this.message});
}
