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
    } else if (event is UpdateData) {
      UserModels updatedUser = (state as UserLoaded)
          .userModels
          .copyWith(name: event.name, profilePicture: event.profilImage);
      await UserServices.updateUser(updatedUser);
      yield UserLoaded(updatedUser);
    } else if (event is TopUp) {
      if (state is UserLoaded) {
        try {
          UserModels updatedUser = (state as UserLoaded).userModels.copyWith(
              balance: (state as UserLoaded).userModels.balance + event.amount);
          await UserServices.updateUser(updatedUser);
          yield UserLoaded(updatedUser);
        } catch (e) {
          print(e);
        }
      }
    } else if (event is Purchase) {
      if (state is UserLoaded) {
        try {
          UserModels updatedUser = (state as UserLoaded).userModels.copyWith(
              balance: (state as UserLoaded).userModels.balance - event.amount);
          await UserServices.updateUser(updatedUser);
          yield UserLoaded(updatedUser);
        } catch (e) {
          print(e);
        }
      }
    }
  }
}
