import 'package:flutter/cupertino.dart';
import 'package:memory_game_app/features/game/presentation/views/game_view.dart';
import 'package:memory_game_app/features/game/presentation/views/leaderboard_view.dart';
import 'package:memory_game_app/features/menu/presentation/views/menu_view.dart';

const String splashScreenView = '/';
const String gameView = '/game';
const String leaderboardView = '/leaderBoard';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splashScreenView:
      return CupertinoPageRoute(builder: (_) => const SplashScreenView(), settings: settings);
    case gameView:
      return CupertinoPageRoute(builder: (_) => const GameView(), settings: settings);
    case leaderboardView:
      return CupertinoPageRoute(builder: (_) => const LeaderboardView(), settings: settings);
    default:
      throw ('Route does not exist');
  }
}
