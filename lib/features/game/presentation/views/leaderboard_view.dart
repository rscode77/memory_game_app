import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:gap/gap.dart';
import 'package:memory_game_app/config/enums.dart';
import 'package:memory_game_app/features/menu/presentation/widget/custom_button_widget.dart';

import '../../../../config/constants.dart';
import '../../../menu/presentation/blocs/user/user_bloc.dart';
import '../blocs/game_bloc/game_bloc.dart';
import '../widgets/leaderboard_position_widget.dart';

class LeaderboardView extends StatefulWidget {
  const LeaderboardView({super.key});

  @override
  State<LeaderboardView> createState() => _LeaderboardViewState();
}

class _LeaderboardViewState extends State<LeaderboardView> {
  int _selectedLeaderboard = 0;

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
                  _selectedLeaderboard == 0 ? 'Time leaderboard' : 'Tap leaderboard',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Gap(20.h),
            Row(
              children: [
                Text(
                  'User: ',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  context.read<UserBloc>().state.user!.name,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Gap(30.h),
            FlutterToggleTab(
              width: 80.w,
              borderRadius: 17,
              height: 50.h,
              selectedIndex: _selectedLeaderboard,
              selectedBackgroundColors: const [blue],
              unSelectedBackgroundColors: [lightGray.withOpacity(0.4)],
              selectedTextStyle: const TextStyle(color: Colors.white),
              unSelectedTextStyle: TextStyle(color: Colors.white.withOpacity(0.20)),
              icons: const [Icons.timer_rounded, Icons.touch_app_rounded],
              selectedLabelIndex: (index) {
                setState(() {
                  _selectedLeaderboard = index;
                });
              },
              labels: const ['', ''],
            ),
            BlocBuilder<GameBloc, GameState>(
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _selectedLeaderboard == 0 ? state.timeLeaderboard.length : state.tapLeaderboard.length,
                  itemBuilder: (context, index) {
                    return LeaderboardPositionWidget(
                      gameState: state,
                      position: index,
                      leaderboardType: _selectedLeaderboard == 0 ? LeaderboardType.time : LeaderboardType.tap,
                    );
                  },
                );
              },
            ),
            const Spacer(),
            CustomButton(
              onPressed: () => Navigator.pop(context),
              icon: Icons.games_rounded,
              text: 'Back to game',
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
