import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/constants.dart';

class FieldWidget extends StatefulWidget {
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
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: 90.h,
        width: 90.w,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: widget.uncovered ? blue : gray,
          border: Border.all(width: 4.5.sp, color: widget.uncovered ? Colors.transparent : lightGray.withOpacity(0.6)),
        ),
        child: Center(
          child: widget.uncovered
              ? Text(
                  '${widget.index}',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              : null,
        ),
      ),
    );
  }
}
