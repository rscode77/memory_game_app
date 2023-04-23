// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class CheckFieldEvent extends GameEvent {
  final int field;

  const CheckFieldEvent({
    required this.field,
  });

  @override
  List<Object> get props => [field];
}

class InitNewGameEvent extends GameEvent {}

class ChangeGameStatusEvent extends GameEvent {
  final GameStatus gameStatus;

  const ChangeGameStatusEvent({
    required this.gameStatus,
  });

  @override
  List<Object> get props => [gameStatus];
}

class UncoverFieldEvent extends GameEvent {
  final List<int> uncoveredFields;

  const UncoverFieldEvent({
    required this.uncoveredFields,
  });

  @override
  List<Object> get props => [uncoveredFields];
}

class UpdateUserRecord extends GameEvent {
  final int record;

  const UpdateUserRecord({
    required this.record,
  });

  @override
  List<Object> get props => [record];
}
