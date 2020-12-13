import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ticket/models/models.dart';
import 'package:flutter_ticket/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      UserModels userModels = await UserServices.getUser(event.id);
      yield UserLoaded(userModels);
    } else if (event is SignOut) {
      yield UserInitial();
    }
  }
}
