import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/routes.dart';
import '../blocs/user/user_bloc.dart';
import '../widget/loading_widget.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                                Text('Set username'),
                                TextField(controller: userNameController),
                                ElevatedButton(
                                  onPressed: () => context.read<UserBloc>().add(AddUserEvent(name: userNameController.text)),
                                  child: Text('Start game'),
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
              Gap(40.h),
            ],
          ),
        ),
      ),
    );
  }
}
