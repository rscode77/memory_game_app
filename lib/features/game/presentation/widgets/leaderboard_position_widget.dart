import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/constants.dart';
import '../blocs/game_bloc/game_bloc.dart';

class LeaderboardPositionWidget extends StatelessWidget {
  final int position;
  final GameState gameState;

  const LeaderboardPositionWidget({
    Key? key,
    required this.position,
    required this.gameState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(15.h),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: position < 3 ? blue : gray,
                borderRadius: BorderRadius.circular(17),
              ),
              width: 55.w,
              height: 55.h,
              child: Center(
                child: Text(
                  '#${position + 1}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
            Gap(20.w),
            Text(
              gameState.timeLeaderboard[position].name,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const Spacer(),
            Text(
              formatedTime(gameState.timeLeaderboard[position].record!),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ],
    );
  }

  String formatedTime(int milliseconds) {
    Duration duration = Duration(milliseconds: milliseconds);
    return duration.toString().split('.').first;
  }
}
