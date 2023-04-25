// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'game_bloc.dart';

class GameState extends Equatable {
  final List<int> fields;
  final List<int> uncoveredFields;
  final List<int> checkedFields;
  final List<User> leaderBoard;
  final GameStatus gameStatus;
  const GameState({
    required this.fields,
    required this.uncoveredFields,
    required this.checkedFields,
    required this.leaderBoard,
    required this.gameStatus,
  });

  @override
  List<Object> get props => [gameStatus, fields, uncoveredFields, checkedFields];

  GameState copyWith({
    List<int>? fields,
    List<int>? uncoveredFields,
    List<int>? checkedFields,
    GameStatus? gameStatus,
  }) {
    return GameState(
      fields: fields ?? this.fields,
      uncoveredFields: uncoveredFields ?? this.uncoveredFields,
      checkedFields: checkedFields ?? this.checkedFields,
      gameStatus: gameStatus ?? this.gameStatus,
      leaderBoard: [],
    );
  }
}
