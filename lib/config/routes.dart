import 'package:flutter/material.dart';
import 'package:memory_game_app/features/game/presentation/views/game_view.dart';
import 'package:memory_game_app/features/menu/presentation/views/menu_view.dart';

const String splashScreenView = '/';
const String gameView = '/game';

Route<dynamic> controller(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case splashScreenView:
      builder = (BuildContext _) => const SplashScreenView();
      break;
    case gameView:
      builder = (BuildContext _) => const GameView();
      break;
    default:
      throw ('Route does not exist');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
}
