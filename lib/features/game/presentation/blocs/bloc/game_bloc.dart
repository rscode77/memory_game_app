import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../config/enums.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameState(gameStatus: GameStatus.notInitiated, fields: [], uncoveredFields: [])) {
    on<InitNewGameEvent>((event, emit) {
      List<int> fields = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10];
      fields.shuffle();
      print(fields);
    });
    on<ChangeGameStatusEvent>((event, emit) {});
  }
}
