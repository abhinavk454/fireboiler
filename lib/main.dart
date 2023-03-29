import 'package:firebase_core/firebase_core.dart';
import 'package:fireboiler/services/state_service.dart';
import 'package:fireboiler/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      initialRoute: "/home",
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.ralewayTextTheme(
          textTheme,
        ),
      ),
    );
  }
}
