import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memory_game_app/features/game/data/entities/api_response.dart';
import 'package:memory_game_app/features/game/data/entities/rank.dart';
import 'package:memory_game_app/features/game/data/repository/game_repository_impl.dart';

import '../../../../../config/enums.dart';
import '../../../../menu/data/entities/user.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc()
      : super(const GameState(
          gameStatus: GameStatus.notInitiated,
          fields: [],
          uncoveredFields: [],
          checkedFields: [],
          leaderboard: [],
          currentRank: 0,
        )) {
    on<InitNewGameEvent>((event, emit) {
      List<int> fields = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 0, 0];
      fields.shuffle();
      emit(state.copyWith(
        gameStatus: GameStatus.notInitiated,
        fields: fields,
        uncoveredFields: [],
        checkedFields: [],
      ));
    });
    on<ChangeGameStatusEvent>((event, emit) async {
      emit(state.copyWith(gameStatus: event.gameStatus));
      if (state.gameStatus == GameStatus.finished) {}
    });
    on<UpdateUserRecord>((event, emit) async {
      ApiResponse newRecord = await GameRepositoryImpl().updateUserRecord(event.record);
      if (newRecord.statusCode == 200) {
        emit(state.copyWith(currentRank: newRecord.response));
      }
    });
    on<UpdateRankEvent>((event, emit) async {
      emit(state.copyWith(currentRank: event.rank));
    });
    on<GetUserRank>((event, emit) async {
      Rank rank = await GameRepositoryImpl().getUserRank(event.uniqueId);
      emit(state.copyWith(currentRank: rank.rank));
    });
    on<GetLeaderBoard>((event, emit) async {
      var leaderboard = await GameRepositoryImpl().getLeaderboardList();
      emit(state.copyWith(leaderboard: leaderboard));
    });
    on<CheckFieldEvent>((event, emit) async {
      if (state.checkedFields.length < 2) {
        if (state.checkedFields.isEmpty || state.checkedFields[0] != event.field) {
          emit(state.copyWith(
            checkedFields: List.of(state.checkedFields)..add(event.field),
          ));
        }
      }

      if (state.checkedFields.length == 2) {
        if (state.fields[state.checkedFields[0]] == state.fields[state.checkedFields[1]]) {
          emit(state.copyWith(
              uncoveredFields: List.of(state.uncoveredFields)
                ..add(state.checkedFields[0])
                ..add(state.checkedFields[1]),
              checkedFields: []));
        } else {
          await Future.delayed(const Duration(milliseconds: 500));
          emit(state.copyWith(checkedFields: []));
        }
      }
    });
  }
}
