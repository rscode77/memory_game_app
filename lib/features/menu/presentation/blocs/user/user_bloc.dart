import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memory_game_app/features/menu/data/repository/user_auth_repository_impl.dart';

import '../../../data/entities/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState(user: null, loading: true)) {
    on<AuthUserEvent>((event, emit) async {
      var authUser = await UserAuthRepositoryImpl().authUser();
      emit(state.copyWith(user: authUser, loading: false));
    });
    on<AddUserEvent>((event, emit) async {
      await UserAuthRepositoryImpl().addUser(name: event.name);
      add(const AuthUserEvent());
    });
  }
}
