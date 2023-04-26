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
  // int _number1 = 0;
  // int _number2 = 0;
  // int _number3 = 0;
  // int _number4 = 0;

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
      children: [
        logoImage,
        // //top left
        // LogoTextdWidget(
        //   number1: _number1,
        //   paddingTop: 28,
        //   paddingLeft: 37,
        // ),
        // //top right
        // LogoTextdWidget(
        //   number1: _number2,
        //   paddingTop: 28,
        //   paddingLeft: 139,
        // ),
        // //bottom right
        // LogoTextdWidget(
        //   number1: _number3,
        //   paddingTop: 130,
        //   paddingLeft: 139,
        // ),
        // //bottom left
        // LogoTextdWidget(
        //   number1: _number4,
        //   paddingTop: 130,
        //   paddingLeft: 37,
        // ),
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
      // _number1 = Random().nextInt(9);
      // _number2 = Random().nextInt(9);
      // _number3 = Random().nextInt(9);
      // _number4 = Random().nextInt(9);
    });
  }
}
