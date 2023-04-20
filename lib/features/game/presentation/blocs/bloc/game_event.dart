part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class InitNewGameEvent extends GameEvent {}

class ChangeGameStatusEvent extends GameEvent {}

class UncoverFieldEvent extends GameEvent {
  final List<int> uncoveredFields;

  const UncoverFieldEvent({
    required this.uncoveredFields,
  });
}
