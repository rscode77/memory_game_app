part of 'user_bloc.dart';

class UserState extends Equatable {
  final User? user;
  final bool loading;

  const UserState({
    required this.user,
    required this.loading,
  });

  @override
  List<Object?> get props => [user];

  UserState copyWith({
    User? user,
    bool? loading,
  }) {
    return UserState(
      user: user ?? this.user,
      loading: loading ?? this.loading,
    );
  }
}
