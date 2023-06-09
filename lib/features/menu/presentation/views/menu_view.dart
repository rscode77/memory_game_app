import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:memory_game_app/config/constants.dart';

import '../../../../config/routes.dart';
import '../../../game/presentation/blocs/game_bloc/game_bloc.dart';
import '../blocs/user/user_bloc.dart';
import '../widget/custom_button_widget.dart';
import '../widget/custom_textfield_widget.dart';
import '../widget/loading_widget.dart';
import '../widget/logo_widget.dart';
import '../widget/text_carousel_widget.dart';

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
    // print(MediaQuery.of(context).size.width);
    // print(MediaQuery.of(context).size.height);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                maxWidth: 400.w,
              ),
              child: IntrinsicHeight(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [backgroundTop, backgroundBottom],
                      stops: [0.03, 0.9],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const LogoWidget(),
                      Gap(60.h),
                      const TextCarousel(),
                      Gap(20.h),
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
                                        CustomTextField(
                                          userNameController: userNameController,
                                          hint: 'Username',
                                          icon: Icons.person,
                                          textFieldTitle: userState.userExists ? 'Username already exists' : 'Type username',
                                        ),
                                        Gap(20.h),
                                        CustomButton(
                                          color: blue,
                                          icon: Icons.person_add_alt_1_rounded,
                                          text: 'Add user',
                                          onPressed: () {
                                            if (userNameController.text.isNotEmpty) {
                                              context.read<UserBloc>().add(AddUserEvent(name: userNameController.text));
                                            }
                                          },
                                        ),
                                        Gap(40.h),
                                      ],
                                    )
                                  :
                                  //user authenticated
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomButton(
                                          color: blue,
                                          icon: Icons.play_arrow_rounded,
                                          text: 'Start game',
                                          onPressed: () {
                                            context.read<GameBloc>().add(UpdateRankEvent(rank: context.read<UserBloc>().state.user!.rank!));
                                            Navigator.pushNamedAndRemoveUntil(context, gameView, (route) => false);
                                          },
                                        ),
                                        Gap(40.h),
                                      ],
                                    );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
