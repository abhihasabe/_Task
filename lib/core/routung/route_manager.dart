import 'package:task/features/splash/presentation/screen/splash_screen.dart';
import 'package:task/features/home/presentation/screen/home_screen.dart';
import 'package:task/core/constants/app_route_constant.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: AppRouteConstants.splashScreen,
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Splash();
        },
      ),
      GoRoute(
        name: AppRouteConstants.homeScreen,
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const Home();
        },
      )
    ],
  );
}
