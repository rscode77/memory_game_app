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
  int _number = 0;

  late Timer _timer;
  late Image logoImage;
  @override
  void initState() {
    super.initState();
    logoImage = Image.asset(
      'assets/images/memory_logo.png',
      height: 200.h,
      width: 200.w,
    );
    _timer = Timer.periodic(const Duration(seconds: 3), (_) => _generateNumber());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(logoImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        LogoTextdWidget(
          number1: _number,
        ),
        logoImage,
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
      _number = Random().nextInt(9);
    });
  }
}
