import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game_app/features/menu/presentation/widget/logo_text_widget.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget({
    super.key,
  });

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  int _number1 = 0;
  int _number2 = 0;
  int _number3 = 0;
  int _number4 = 0;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) => _generateNumber());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/memory_logo.png',
          height: 250.h,
          width: 250.w,
        ),
        LogoTextdWidget(
          number1: _number1,
          paddingTop: 40,
          paddingLeft: 48,
        ),
        LogoTextdWidget(
          number1: _number2,
          paddingTop: 40,
          paddingLeft: 182,
        ),
        LogoTextdWidget(
          number1: _number3,
          paddingTop: 170,
          paddingLeft: 182,
        ),
        LogoTextdWidget(
          number1: _number4,
          paddingTop: 170,
          paddingLeft: 48,
        ),
      ],
    )
        .animate(
          onPlay: (controller) => controller.repeat(
            period: const Duration(milliseconds: 5000),
          ),
        )
        .shake();
  }

  void _generateNumber() {
    setState(() {
      _number1 = Random().nextInt(9);
      _number2 = Random().nextInt(9);
      _number3 = Random().nextInt(9);
      _number4 = Random().nextInt(9);
    });
  }
}
