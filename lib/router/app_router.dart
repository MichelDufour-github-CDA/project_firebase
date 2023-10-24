import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_firebase/blocks/authentication_cubit.dart';
import 'package:project_firebase/presentation/pages/home_page.dart';
import 'package:project_firebase/presentation/pages/login_page.dart';
import 'package:project_firebase/presentation/pages/register_page.dart';
import 'package:go_router/go_router.dart';
import 'package:project_firebase/router/go_router_refresh_stream.dart';

abstract class AppRouter {
  static final _publicRoutes = <String>[
    '/login',
    '/register',
  ];

  static GoRouter routerOf(BuildContext context) => GoRouter(
        initialLocation: '/login',
        refreshListenable: GoRouterRefreshStream(
          context.read<AuthenticationCubit>().stream,
        ),
        redirect: (context, state) {
          final status = context.read<AuthenticationCubit>().state.status;

          // Si l'utilisateur est déconnecté, et n'est PAS sur une page publique
          // Si on est dans une page privée
          // Alors je le redirige vers /login
          if (!_publicRoutes.contains(state.uri.toString()) &&
              status == AuthenticationStatus.unauthenticated) {
            return '/login';
          }

          // Si l'utilisateur est connecté, mais est sur une page publique
          // Alors je le redirige vers /home
          if (_publicRoutes.contains(state.uri.toString()) &&
              status == AuthenticationStatus.authenticated) {
            return '/home';
          }

          return null;
        },
        routes: [
          GoRoute(
            path: '/login',
            name: LoginPage.name,
            builder: (context, state) => LoginPage(),
          ),
          GoRoute(
            path: '/register',
            name: RegisterPage.name,
            builder: (context, state) => RegisterPage(),
          ),
          GoRoute(
            path: '/home',
            name: HomePage.name,
            builder: (context, state) => const HomePage(),
          ),
        ],
      );
}
