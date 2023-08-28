import 'package:flutter/material.dart';
import 'package:tarot/pages/home_page.dart';
import 'package:tarot/pages/random_one_tarot_detail_page.dart';
import 'package:tarot/pages/tarot_detail_page.dart';

// ignore_for_file: avoid_classes_with_only_static_members
class RouterName {
  static const String bootstrap = '/';
  static const String randomOneTarotDetail = '/randomOneTarotDetail';
  static const String tarotDetail = '/tarotDetail';
}

class AppRoutes {
  static Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    print('Navigate to:' + (settings.name ?? ''));
    switch (settings.name) {
      case RouterName.bootstrap:
        return _materialRoute(settings, const HomePage());
      case RouterName.randomOneTarotDetail:
        return _materialRoute(settings, const RandomOneTarotDetailPage());
      case RouterName.tarotDetail:
        return _materialRoute(settings, const TarotDetailPage());
    }
  }

  static Route<dynamic> _materialRoute(RouteSettings settings, Widget view) {
    return MaterialPageRoute<dynamic>(
      settings: settings,
      builder: (_) => view,
    );
  }

  static Route<dynamic> _pageRouteBuilderWithPresentEffect(RouteSettings settings, Widget view) {
    return PageRouteBuilder<dynamic>(
      settings: settings,
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          view,
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        const Offset begin = Offset(0.0, 1.0);
        const Offset end = Offset.zero;
        final Cubic curve = Curves.ease;

        final Animatable<Offset> tween =
            Tween<Offset>(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> _pageRouteBuilderWithFadeEffect(RouteSettings settings, Widget view) {
    return PageRouteBuilder<dynamic>(
      settings: settings,
      opaque: false,
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          view,
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
