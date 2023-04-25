import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoTextdWidget extends StatelessWidget {
  final int _number1;
  final int paddingLeft;
  final int paddingTop;

  const LogoTextdWidget({
    super.key,
    required int number1,
    required this.paddingLeft,
    required this.paddingTop,
  }) : _number1 = number1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft.w, top: paddingTop.h),
      child: Text(
        '$_number1',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
