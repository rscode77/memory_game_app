import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game_app/features/game/presentation/widgets/field_widget.dart';
import 'package:gap/gap.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i = 0; i < 5; i++)
              Row(
                children: [
                  for (var i = 0; i < 4; i++) const FieldWidget(index: 0),
                ],
              ),
          ],
        ),
      )),
    );
  }
}
