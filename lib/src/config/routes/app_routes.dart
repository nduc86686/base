import 'package:flutter/material.dart';

import '../../presentation/views/breaking_news_view.dart';

///config routes for app[main.dart]
class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(BreakingNewsView());

      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
