import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router_navbar/go_router/screens/newspage.dart';
import 'package:router_navbar/go_router/screens/searchpage.dart';
import 'package:router_navbar/go_router/screens/settingspage.dart';
import 'package:router_navbar/go_router/screens/videopage.dart';

import 'screens/homepage.dart';

final _parentKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

Page<void> noTransitionPageBuilder(
    BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child; // No animation
    },
  );
}

final router = GoRouter(navigatorKey: _parentKey, routes: [
  ShellRoute(
      navigatorKey: _shellKey,
      builder: (context, state, child) => HomePage(
            child: child,
          ),
      routes: [
        GoRoute(
          path: '/',
          name: 'news',
          parentNavigatorKey: _shellKey,
          pageBuilder: (context, state) => noTransitionPageBuilder(
            context,
            state,
            const Newspage(),
          ),
        ),
        GoRoute(
          path: SettingsPage.route,
          parentNavigatorKey: _shellKey,
          name: 'settings',
          pageBuilder: (context, state) =>
              noTransitionPageBuilder(context, state, const SettingsPage()),
        ),
        GoRoute(
          path: VideoPage.route,
          parentNavigatorKey: _shellKey,
          name: 'videos',
          pageBuilder: (context, state) =>
              noTransitionPageBuilder(context, state, const VideoPage()),
        ),
        GoRoute(
          path: SearchPage.route,
          parentNavigatorKey: _shellKey,
          name: 'search',
          pageBuilder: (context, state) =>
              noTransitionPageBuilder(context, state, const SearchPage()),
        )
      ]),
]);
