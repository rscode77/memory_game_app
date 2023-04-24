import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/constants.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  const CustomButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        ),
        onPressed: onPressed,
        icon: const Icon(
          Icons.start_rounded,
          size: 18,
        ),
        label: Text('Login', style: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }
}
