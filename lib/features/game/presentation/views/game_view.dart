import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:memory_game_app/config/enums.dart';
import 'package:memory_game_app/config/routes.dart';
import 'package:memory_game_app/features/menu/presentation/blocs/user/user_bloc.dart';

import '../../../../config/constants.dart';
import '../../../menu/presentation/widget/custom_button_widget.dart';
import '../blocs/game_bloc/game_bloc.dart';
import '../blocs/timer_cubit/timer_cubit.dart';
import '../widgets/current_rank_widget.dart';
import '../widgets/game_fields.dart';
import '../widgets/timer_widget.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        constraints: BoxConstraints(maxWidth: 400.w),
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundTop, backgroundBottom],
            stops: [0.03, 0.9],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            //game fields
            BlocBuilder<GameBloc, GameState>(
              builder: (context, gameState) {
                if (gameState.uncoveredFields.length == 20) {
                  context.read<TimerCubit>().stop();
                  context.read<GameBloc>().add(const ChangeGameStatusEvent(gameStatus: GameStatus.finished));
                  context.read<GameBloc>().add(UpdateUserRecord(record: context.read<TimerCubit>().state.time));
                }
                return Column(
                  children: [
                    CurrentRank(
                      currentRank: gameState.currentRank,
                      totalTaps: gameState.totalTaps,
                    ),
                    Gap(15.h),
                    GameFields(gameState: gameState),
                  ],
                );
              },
            ),
            Gap(30.h),
            BlocBuilder<TimerCubit, TimerState>(
              builder: (context, timerState) {
                return Column(
                  children: [
                    //timer
                    TimerWidget(
                      time: timerState.time,
                      status: timerState.status,
                    ),
                    Gap(35.h),
                    //start game button
                    CustomButton(
                      color: timerState.status == TimerStatus.ticking ? gray : blue,
                      icon: timerState.status == TimerStatus.ticking ? Icons.stop_rounded : Icons.play_arrow_rounded,
                      text: timerState.status == TimerStatus.ticking ? 'Stop game' : 'Start game',
                      onPressed: () {
                        timerState.status == TimerStatus.off
                            ? {
                                context.read<GameBloc>().add(InitNewGameEvent()),
                                context.read<TimerCubit>().start(),
                              }
                            : {
                                context.read<GameBloc>().add(const ChangeGameStatusEvent(gameStatus: GameStatus.notInitiated)),
                                context.read<TimerCubit>().stop(),
                              };
                      },
                    ),
                    Gap(15.h),
                    //leaderboard button
                    CustomButton(
                      color: gray,
                      icon: Icons.rocket_launch_rounded,
                      text: 'Leaderboard',
                      onPressed: () {
                        context.read<GameBloc>().add(GetUserRank(uniqueId: context.read<UserBloc>().state.user!.uniqueId));
                        context.read<GameBloc>().add(GetLeaderBoard());
                        Navigator.pushNamed(context, leaderboardView);
                      },
                    ),
                    Gap(40.h),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
