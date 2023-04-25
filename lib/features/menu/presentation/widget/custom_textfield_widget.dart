import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.userNameController,
    required this.hint,
    required this.icon,
    required this.textFieldTitle,
  }) : super(key: key);

  final TextEditingController userNameController;
  final String hint;
  final IconData icon;
  final String textFieldTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 18,
              ),
              Gap(10.w),
              Text(
                textFieldTitle,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
        ),
        Gap(12.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: 70.h,
          decoration: BoxDecoration(
            color: gray,
            borderRadius: BorderRadius.circular(17),
          ),
          child: TextField(
            cursorColor: blue,
            cursorHeight: 18,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: darkGray,
                  ),
            ),
            controller: userNameController,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ],
    );
  }
}
