import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memory_game_app/config/constants.dart';
import 'package:memory_game_app/features/game/presentation/blocs/timer_cubit/timer_cubit.dart';

import 'config/routes.dart' as route;
import 'features/game/presentation/blocs/game_bloc/game_bloc.dart';
import 'features/menu/presentation/blocs/user/user_bloc.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: backgroundBottom,
    systemNavigationBarDividerColor: backgroundBottom,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 825.4545454545455),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => UserBloc()..add(const AuthUserEvent())),
            BlocProvider(create: (context) => GameBloc()),
            BlocProvider(create: (context) => TimerCubit()),
          ],
          child: MaterialApp(
            title: 'MemoryGame',
            theme: ThemeData(
              textTheme: TextTheme(
                titleLarge: GoogleFonts.plusJakartaSans(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                titleSmall: GoogleFonts.plusJakartaSans(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                titleMedium: GoogleFonts.plusJakartaSans(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
                displayLarge: GoogleFonts.plusJakartaSans(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                labelMedium: GoogleFonts.plusJakartaSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                labelSmall: GoogleFonts.plusJakartaSans(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                displayMedium: GoogleFonts.plusJakartaSans(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                headlineMedium: GoogleFonts.plusJakartaSans(
                  fontSize: 33.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            initialRoute: route.splashScreenView,
            onGenerateRoute: route.controller,
          ),
        );
      },
    );
  }
}
