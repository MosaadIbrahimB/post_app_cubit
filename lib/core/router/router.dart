import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/router/string_router.dart';

import '../../feature/root/presentation/screen/layout_screen.dart';
import '../../feature/root/presentation/screen/splash_screen.dart';


class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation:StringRouter.layoutScreen ,
    routes: <RouteBase>[
      GoRoute(
        path: StringRouter.splashScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: StringRouter.layoutScreen,
        builder: (BuildContext context, GoRouterState state) =>
         LayoutScreen(),
      )
    ],
  );
}
