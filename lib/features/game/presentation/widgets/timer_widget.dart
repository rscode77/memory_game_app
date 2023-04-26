// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:memory_game_app/config/enums.dart';

import '../../../../config/constants.dart';

class TimerWidget extends StatelessWidget {
  final int time;
  final TimerStatus status;

  const TimerWidget({
    Key? key,
    required this.time,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
              width: 40.w,
              child: Image.asset(
                'assets/images/memory_logo_blue.png',
                color: status == TimerStatus.ticking ? blue : lightGray,
              )
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
                  formatedTime(time),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Gap(44.w),
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
