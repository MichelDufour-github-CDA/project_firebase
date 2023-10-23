import 'package:project_firebase/presentation/pages/home_page.dart';
import 'package:project_firebase/presentation/pages/login_page.dart';
import 'package:project_firebase/presentation/pages/register_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation:'/login',

    routes: [
      GoRoute(path: '/login',
      name: LoginPage.name,
      builder: (context, satate) => LoginPage(),
      ),
      GoRoute(path: '/register',
      name: RegisterPage.name,
      builder: (context, satate) => RegisterPage(),
      ),
      GoRoute(path: '/home',
      name: HomePage.name,
      builder: (context, satate) => const HomePage(),
      ),
    ]
  );
}