import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:memory_game_app/config/enums.dart';

import '../blocs/game_bloc/game_bloc.dart';
import '../blocs/timer_cubit/timer_cubit.dart';
import '../widgets/game_fields.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              //game fields
              BlocBuilder<GameBloc, GameState>(
                builder: (context, gameState) {
                  if (gameState.uncoveredFields.length == 20) {
                    context.read<TimerCubit>().stop();
                    context.read<GameBloc>().add(const ChangeGameStatusEvent(gameStatus: GameStatus.finished));
                  }
                  return gameState.fields.isEmpty ? Container() : GameFields(gameState: gameState);
                },
              ),
              Gap(60.h),
              //timer
              BlocBuilder<TimerCubit, int>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Text('Current time:'),
                      Text('$state'),
                    ],
                  );
                },
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  context.read<GameBloc>().add(InitNewGameEvent());
                  context.read<TimerCubit>().start();
                },
                child: Text('Start new game'),
              ),
              Gap(40.h),
            ],
          ),
        ),
      ),
    );
  }
}
