// NOTE: this file is processed as a Handlebars template by the generator.
// {{ inputs.projectName }} will be replaced with the actual package name at generation time.

import 'package:{{ inputs.projectName }}/features/auth/screens/login.dart';
import 'package:{{ inputs.projectName }}/features/auth/screens/register.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Home')),
      ),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
