import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory_game_app/features/game/presentation/blocs/bloc/game_bloc.dart';

import '../../../../config/constants.dart';

class FieldWidget extends StatelessWidget {
  final int index;
  const FieldWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<GameBloc>().add(InitNewGameEvent());
      },
      child: Container(
        height: 90.h,
        width: 90.w,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: NeumorphicButton(
          style: index == 0 ? coveredStyle() : uncoveredStyle(),
          onPressed: () {},
          child: Center(
            child: Text('$index'),
          ),
        ),
      ),
    );
  }

  NeumorphicStyle? uncoveredStyle() {
    return const NeumorphicStyle(
      shape: NeumorphicShape.concave,
      depth: 2,
      lightSource: LightSource.topLeft,
      color: Colors.white,
    );
  }

  NeumorphicStyle? coveredStyle() {
    return NeumorphicStyle(
      shape: NeumorphicShape.concave,
      depth: 2,
      lightSource: LightSource.topLeft,
      color: blue,
    );
  }
}
