import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game_app/config/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 65.h,
          width: 65.w,
          child: const CircularProgressIndicator(
            color: blue,
            strokeWidth: 5,
          ),
        )
      ],
    );
  }
}
