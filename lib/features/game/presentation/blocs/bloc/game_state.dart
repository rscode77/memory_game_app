part of 'game_bloc.dart';

class GameState extends Equatable {
  final List<int> fields;
  final List<int> uncoveredFields;
  final GameStatus gameStatus;
  const GameState({
    required this.fields,
    required this.uncoveredFields,
    required this.gameStatus,
  });

  @override
  List<Object> get props => [gameStatus, fields, uncoveredFields];

  GameState copyWith({
    List<int>? fields,
    List<int>? uncoveredFields,
    GameStatus? gameStatus,
  }) {
    return GameState(
      fields: fields ?? this.fields,
      uncoveredFields: uncoveredFields ?? this.uncoveredFields,
      gameStatus: gameStatus ?? this.gameStatus,
    );
  }
}
