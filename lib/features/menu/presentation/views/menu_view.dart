import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:memory_game_app/config/constants.dart';

import '../../../../config/routes.dart';
import '../blocs/user/user_bloc.dart';
import '../widget/custom_button.dart';
import '../widget/custom_textfield.dart';
import '../widget/loading_widget.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  TextEditingController userNameController = TextEditingController();
  bool man = true;
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [backgroundTop, backgroundBottom],
          stops: [0.03, 0.9],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        )),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Memory\nGame',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Image.asset(
              'assets/images/memory_logo.png',
              height: 250.h,
              width: 250.w,
            ),
            const Spacer(),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, userState) {
                return userState.loading
                    ?
                    //loading
                    const LoadingWidget()
                    : userState.user == null
                        ?
                        //user not authenticated
                        Column(
                            children: [
                              Gap(10.h),
                              CustomTextField(
                                userNameController: userNameController,
                                hint: 'Username',
                                icon: Icons.person,
                                textFieldTitle: 'Type name',
                              ),
                              Gap(20.h),
                              CustomButton(
                                onPressed: () {
                                  if (userNameController.text.isNotEmpty) {
                                    context.read<UserBloc>().add(AddUserEvent(name: userNameController.text));
                                  }
                                },
                              ),
                            ],
                          )
                        :
                        //user authenticated
                        Column(
                            children: [
                              Text('Welcome text'),
                              ElevatedButton(
                                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, gameView, (route) => false),
                                child: Text('Start game'),
                              ),
                              ElevatedButton(
                                onPressed: () => {},
                                child: Text('Leaderboard'),
                              ),
                            ],
                          );
              },
            ),
            Gap(50.h),
          ],
        ),
      ),
    );
  }
}
