part of 'firebase_bloc.dart';

@immutable
sealed class FirebaseState {}

final class FirebaseInitial extends FirebaseState {}

final class FirebaseLoading extends FirebaseState {}

final class FirebaseSuccess extends FirebaseState {}

final class FirebaseError extends FirebaseState {
  final String errorMessage;

  FirebaseError(this.errorMessage);
}
