import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:memory_game_app/features/menu/presentation/widget/custom_button_widget.dart';

import '../../../../config/constants.dart';
import '../blocs/game_bloc/game_bloc.dart';

class LeaderboardView extends StatelessWidget {
  const LeaderboardView({super.key});

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(60.h),
            Row(
              children: [
                Gap(10.w),
                const Icon(
                  size: 28,
                  Icons.rocket_launch_rounded,
                  color: Colors.white,
                )
                    .animate(
                      onPlay: (controller) => controller.repeat(
                        period: const Duration(milliseconds: 5000),
                      ),
                    )
                    .shake(),
                Gap(20.w),
                Text(
                  'Leaderboard',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            BlocBuilder<GameBloc, GameState>(
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.leaderboard.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Gap(15.h),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: index < 3 ? blue : gray,
                                borderRadius: BorderRadius.circular(17),
                              ),
                              width: 65.w,
                              height: 65.h,
                              child: Center(
                                child: Text(
                                  '#${index + 1}',
                                  style: Theme.of(context).textTheme.displayMedium,
                                ),
                              ),
                            ),
                            Gap(20.w),
                            Text(
                              state.leaderboard[index].name,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            const Spacer(),
                            Text(
                              formatedTime(state.leaderboard[index].record),
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const Spacer(),
            CustomButton(
              onPressed: () => Navigator.pop(context),
              icon: Icons.arrow_back_rounded,
              text: 'Back',
              color: gray,
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
