// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'game_bloc.dart';

class GameState extends Equatable {
  final List<int> fields;
  final List<int> uncoveredFields;
  final List<int> checkedFields;
  final List<User> leaderboard;
  final int currentRank;
  final GameStatus gameStatus;
  const GameState({
    required this.fields,
    required this.uncoveredFields,
    required this.checkedFields,
    required this.leaderboard,
    required this.currentRank,
    required this.gameStatus,
  });

  @override
  List<Object> get props => [gameStatus, fields, uncoveredFields, checkedFields, currentRank, leaderboard];

  GameState copyWith({
    List<int>? fields,
    List<int>? uncoveredFields,
    List<int>? checkedFields,
    GameStatus? gameStatus,
    int? currentRank,
    List<User>? leaderboard,
  }) {
    return GameState(
      fields: fields ?? this.fields,
      uncoveredFields: uncoveredFields ?? this.uncoveredFields,
      checkedFields: checkedFields ?? this.checkedFields,
      gameStatus: gameStatus ?? this.gameStatus,
      leaderboard: leaderboard ?? this.leaderboard,
      currentRank: currentRank ?? this.currentRank,
    );
  }
}
