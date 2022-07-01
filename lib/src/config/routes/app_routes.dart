import 'package:duck/src/presentation/views/audio/play_screen.dart';
import 'package:flutter/material.dart';

import '../../presentation/views/breaking_news_view.dart';
import '../../presentation/views/login/login_screen.dart';

///config routes for app[main.dart]
class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/BreakingNewsView':
        return _materialRoute(BreakingNewsView());
        case '/':
        return _materialRoute(PlayScreen());
        case '/login':
        return _materialRoute(LoginScreen());

      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
