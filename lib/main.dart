import 'package:firebase_core/firebase_core.dart';
import 'package:fireboiler/services/state_service.dart';
import 'package:fireboiler/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (_) => ApplicationState(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ApplicationState>(context);

    String getInitialRoute() {
      if (state.user != null && state.user!.displayName != null) {
        return "/dashboard";
      } else if (state.user != null) {
        return "/profile";
      }
      return "/";
    }

    return MaterialApp(
      initialRoute: getInitialRoute(),
      routes: routes,
    );
  }
}
