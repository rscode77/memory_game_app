import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/constants.dart';

class FieldWidget extends StatelessWidget {
  final int index;
  final bool uncovered;
  final Function()? onPressed;
  const FieldWidget({
    Key? key,
    required this.index,
    required this.uncovered,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 90.w,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: NeumorphicButton(
        style: uncovered ? coveredStyle() : uncoveredStyle(),
        onPressed: onPressed,
        child: Center(
          child: uncovered ? Text('$index') : null,
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
    return const NeumorphicStyle(
      shape: NeumorphicShape.concave,
      depth: 2,
      lightSource: LightSource.topLeft,
      color: blue,
    );
  }
}
