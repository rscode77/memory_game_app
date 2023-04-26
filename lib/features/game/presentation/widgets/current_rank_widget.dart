// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CurrentRank extends StatelessWidget {
  final int currentRank;
  final int totalTaps;

  const CurrentRank({
    Key? key,
    required this.currentRank,
    required this.totalTaps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Gap(15.w),
        const Icon(
          Icons.rocket_launch_sharp,
          size: 28,
          color: Colors.white,
        )
            .animate(
              onPlay: (controller) => controller.repeat(
                period: const Duration(milliseconds: 5000),
              ),
            )
            .shake(),
        Gap(10.w),
        Row(
          children: [
            Text(
              'Rank: ${currentRank == 0 ? '0' : currentRank}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.touch_app_rounded,
          size: 28,
          color: Colors.white,
        )
            .animate(
              onPlay: (controller) => controller.repeat(
                period: const Duration(milliseconds: 5000),
              ),
            )
            .shake(),
        Gap(10.w),
        Row(
          children: [
            Text(
              'Taps: $totalTaps',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        Gap(15.w),
      ],
    );
  }
}
