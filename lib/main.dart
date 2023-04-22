import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memory_game_app/features/game/presentation/blocs/timer_cubit/timer_cubit.dart';

import 'config/constants.dart';
import 'config/routes.dart' as route;
import 'features/game/presentation/blocs/game_bloc/game_bloc.dart';
import 'features/splash_screen/blocs/bloc/splash_screen_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(500, 932),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => SplashScreenBloc()),
            BlocProvider(create: (context) => GameBloc()),
            BlocProvider(create: (context) => TimerCubit()),
          ],
          child: MaterialApp(
            title: 'MemoryGame',
            theme: ThemeData(
              textTheme: TextTheme(
                titleLarge: GoogleFonts.roboto(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: black,
                ),
                displayLarge: GoogleFonts.roboto(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
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
