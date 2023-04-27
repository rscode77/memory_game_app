import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/constants.dart';
import '../../../../config/enums.dart';
import '../../../menu/presentation/widget/custom_button_widget.dart';
import '../blocs/game_bloc/game_bloc.dart';
import '../blocs/timer_cubit/timer_cubit.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameState gameState = context.read<GameBloc>().state;

    return Container(
      height: 330.h,
      padding: EdgeInsets.symmetric(horizontal: 40.h, vertical: 40.w),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [backgroundTop, backgroundBottom],
          stops: [0.01, 0.6],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(27), topRight: Radius.circular(27)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                gameState.recordStatus == RecordStatus.newRecord ? Icons.add_reaction_rounded : Icons.sentiment_neutral_sharp,
                size: 30,
                color: Colors.white,
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(
                      period: const Duration(milliseconds: 5000),
                    ),
                  )
                  .shake(),
              Gap(15.w),
              Text(
                'Congratulations',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          Gap(15.h),
          Text(
            gameState.recordStatus == RecordStatus.newRecord ? 'Record beaten' : 'Record not broken',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(15.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer,
                        size: 30,
                        color: Colors.white,
                      )
                          .animate(
                            onPlay: (controller) => controller.repeat(
                              period: const Duration(milliseconds: 5000),
                            ),
                          )
                          .shake(),
                      Gap(10.w),
                      Text(
                        formatedTime(context.read<TimerCubit>().state.time),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Gap(10.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.touch_app_sharp,
                        size: 30,
                        color: Colors.white,
                      )
                          .animate(
                            onPlay: (controller) => controller.repeat(
                              period: const Duration(milliseconds: 5000),
                            ),
                          )
                          .shake(),
                      Gap(10.w),
                      Text(
                        gameState.totalTaps.toString(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          CustomButton(
            onPressed: () => Navigator.pop(context),
            icon: Icons.transit_enterexit_rounded,
            text: 'Close',
            color: blue,
          )
        ],
      ),
    );
  }

  String formatedTime(int milliseconds) {
    Duration duration = Duration(milliseconds: milliseconds);
    return duration.toString().split('.').first;
  }
}
