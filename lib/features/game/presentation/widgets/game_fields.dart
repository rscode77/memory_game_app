import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game_app/features/game/presentation/blocs/timer_cubit/timer_cubit.dart';

import '../blocs/game_bloc/game_bloc.dart';
import 'field_widget.dart';

class GameFields extends StatelessWidget {
  final GameState gameState;
  const GameFields({
    Key? key,
    required this.gameState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (r) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
            (i) => FieldWidget(
              index: gameState.fields[r * 4 + i],
              uncovered: gameState.uncoveredFields.contains(r * 4 + i) || gameState.checkedFields.contains(r * 4 + i),
              onPressed: () {
                context.read<GameBloc>().add(CheckFieldEvent(field: r * 4 + i));
              },
            ),
          ),
        ),
      ),
    );
  }
}
