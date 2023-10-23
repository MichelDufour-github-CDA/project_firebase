import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_firebase/firebase_options.dart';
import 'package:project_firebase/router/app_router.dart';

Future<void> main() async {
  // 1. Attendre que le moteur Flutter soit initialisé
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialiser Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 3. Lancer l'application
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}
