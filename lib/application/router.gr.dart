// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../ui/views/play_timer/play_timer_view.dart' as _i2;
import '../ui/views/setup/setup_view.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SetupView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SetupView(),
      );
    },
    PlaytimerView.name: (routeData) {
      final args = routeData.argsAs<PlaytimerViewArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.PlaytimerView(
          key: args.key,
          minutes: args.minutes,
          increment: args.increment,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          SetupView.name,
          path: '/',
        ),
        _i3.RouteConfig(
          PlaytimerView.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.SetupView]
class SetupView extends _i3.PageRouteInfo<void> {
  const SetupView()
      : super(
          SetupView.name,
          path: '/',
        );

  static const String name = 'SetupView';
}

/// generated route for
/// [_i2.PlaytimerView]
class PlaytimerView extends _i3.PageRouteInfo<PlaytimerViewArgs> {
  PlaytimerView({
    _i4.Key? key,
    required int minutes,
    required int increment,
  }) : super(
          PlaytimerView.name,
          path: '/',
          args: PlaytimerViewArgs(
            key: key,
            minutes: minutes,
            increment: increment,
          ),
        );

  static const String name = 'PlaytimerView';
}

class PlaytimerViewArgs {
  const PlaytimerViewArgs({
    this.key,
    required this.minutes,
    required this.increment,
  });

  final _i4.Key? key;

  final int minutes;

  final int increment;

  @override
  String toString() {
    return 'PlaytimerViewArgs{key: $key, minutes: $minutes, increment: $increment}';
  }
}
