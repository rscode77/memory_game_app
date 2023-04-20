import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game_app/features/game/presentation/widgets/field_widget.dart';

import '../blocs/bloc/game_bloc.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: BlocConsumer<GameBloc, GameState>(
          listener: (context, gameState) {},
          builder: (context, gameState) {
            return gameState.fields.isEmpty
                ? Container()
                : Column(
                    children: List.generate(
                      5,
                      (r) => Row(
                        children: List.generate(
                          4,
                          (i) => FieldWidget(
                            index: gameState.fields[r * 4 + i],
                            uncovered: gameState.uncoveredFields.contains(r * 4 + i) || gameState.checkedFields.contains(r * 4 + i),
                            onPressed: () => context.read<GameBloc>().add(CheckFieldEvent(field: r * 4 + i)),
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
      )),
    );
  }
}
