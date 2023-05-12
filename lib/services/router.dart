import 'package:flutter/material.dart';
import 'package:formation/screens/auth_screen.dart';
import 'package:formation/screens/home_screen.dart';
import 'package:formation/screens/second_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:formation/screens/splash_screen.dart';

class RouterService {
  static GoRouter getRoutes() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'splash',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/auth',
          name: 'auth',
          builder: (context, state) => AuthScreen(),
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/second',
          name: 'second',
          builder: (context, state) => const SecondScreen(),
        ),
      ],
    );
  }
}
