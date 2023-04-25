import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:memory_game_app/config/enums.dart';
import 'package:memory_game_app/config/routes.dart';

import '../../../../config/constants.dart';
import '../../../menu/presentation/widget/custom_button_widget.dart';
import '../blocs/game_bloc/game_bloc.dart';
import '../blocs/timer_cubit/timer_cubit.dart';
import '../widgets/game_fields.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundTop, backgroundBottom],
            stops: [0.03, 0.9],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
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
                  context.read<GameBloc>().add(UpdateUserRecord(record: context.read<TimerCubit>().state));
                }
                return GameFields(gameState: gameState);
              },
            ),
            Gap(30.h),
            //timer
            BlocBuilder<TimerCubit, int>(
              builder: (context, timerState) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.h,
                          width: 50.w,
                          child: Image.asset('assets/images/memory_logo.png')
                              .animate(
                                onPlay: (controller) => controller.repeat(
                                  period: const Duration(milliseconds: 5000),
                                ),
                              )
                              .shake(),
                        ),
                        Gap(20.w),
                        Column(
                          children: [
                            Text(
                              'Current time:',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Gap(5.h),
                            Text(
                              formatedTime(timerState),
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        Gap(20.w),
                      ],
                    ),
                  ],
                );
              },
            ),
            Gap(40.h),
            CustomButton(
              color: blue,
              icon: Icons.play_arrow_rounded,
              text: 'Start game',
              onPressed: () {
                context.read<GameBloc>().add(InitNewGameEvent());
                context.read<TimerCubit>().start();
              },
            ),
            Gap(15.h),
            CustomButton(
              color: gray,
              icon: Icons.rocket_launch_rounded,
              text: 'Leaderboard',
              onPressed: () => Navigator.pushNamed(context, leaderboardView),
            ),
            Gap(40.h),
          ],
        ),
      ),
    );
  }

  String formatedTime(int milliseconds) {
    Duration duration = Duration(milliseconds: milliseconds);
    return duration.toString().split('.').first;
  }
}
