// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:portfolio/models/user.dart';
import 'package:portfolio/service/firebase.dart';

part 'firebase_event.dart';
part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  final FirebaseService firebaseService;
  FirebaseBloc(this.firebaseService) : super(FirebaseInitial()) {
    on<MessageButtonPressed>((event, emit) async {
      emit(FirebaseLoading());
      try {
        await firebaseService.sendMessage(event.message);
        emit(FirebaseSuccess());
      } catch (e) {
        emit(FirebaseError(e.toString()));
      }
    });
  }
}
