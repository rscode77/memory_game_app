import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../config/enums.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameState(gameStatus: GameStatus.notInitiated, fields: [], uncoveredFields: [], checkedFields: [])) {
    on<InitNewGameEvent>((event, emit) {
      List<int> fields = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10];
      fields.shuffle();
      emit(state.copyWith(
        gameStatus: GameStatus.notInitiated,
        fields: fields,
        uncoveredFields: [],
        checkedFields: [],
      ));
    });
    on<ChangeGameStatusEvent>((event, emit) {
      emit(state.copyWith(gameStatus: event.gameStatus));
      if (state.gameStatus == GameStatus.finished) {
        //save result to server
      }
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
