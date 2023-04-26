// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'game_bloc.dart';

class GameState extends Equatable {
  final List<int> fields;
  final List<int> uncoveredFields;
  final List<int> checkedFields;
  final List<User> timeLeaderboard;
  final List<User> tapLeaderboard;
  final int currentRank;
  final int totalTaps;
  final GameStatus gameStatus;
  const GameState({
    required this.fields,
    required this.uncoveredFields,
    required this.checkedFields,
    required this.timeLeaderboard,
    required this.tapLeaderboard,
    required this.currentRank,
    required this.totalTaps,
    required this.gameStatus,
  });

  @override
  List<Object> get props => [gameStatus, fields, uncoveredFields, checkedFields, currentRank, timeLeaderboard, tapLeaderboard, totalTaps];

  GameState copyWith({
    List<int>? fields,
    List<int>? uncoveredFields,
    List<int>? checkedFields,
    GameStatus? gameStatus,
    int? currentRank,
    List<User>? timeLeaderboard,
    List<User>? tapLeaderboard,
    int? totalTaps,
  }) {
    return GameState(
      fields: fields ?? this.fields,
      uncoveredFields: uncoveredFields ?? this.uncoveredFields,
      checkedFields: checkedFields ?? this.checkedFields,
      gameStatus: gameStatus ?? this.gameStatus,
      timeLeaderboard: timeLeaderboard ?? this.timeLeaderboard,
      tapLeaderboard: tapLeaderboard ?? this.tapLeaderboard,
      currentRank: currentRank ?? this.currentRank,
      totalTaps: totalTaps ?? this.totalTaps,
    );
  }
}
