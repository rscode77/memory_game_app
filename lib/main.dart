import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memory_game_app/features/game/presentation/blocs/bloc/game_bloc.dart';

import 'config/constants.dart';
import 'config/routes.dart' as route;
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
            BlocProvider(create: (context) => GameBloc()..add(InitNewGameEvent())),
          ],
          child: MaterialApp(
            title: 'MemoryGame',
            theme: ThemeData(
              textTheme: TextTheme(
                titleLarge: GoogleFonts.lato(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: black,
                ),
                titleSmall: GoogleFonts.lato(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: black,
                ),
                headlineLarge: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: black,
                ),
                headlineMedium: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                headlineSmall: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: black,
                ),
                labelLarge: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: black,
                ),
                labelMedium: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: black,
                ),
                labelSmall: GoogleFonts.roboto(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: black,
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
