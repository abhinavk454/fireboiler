import 'package:fireboiler/screens/dashboard_screen.dart';
import 'package:fireboiler/screens/home_screen.dart';
import 'package:fireboiler/screens/profle_screen.dart';

final routes = {
  "/": (context) => const HomeScreen(),
  "/dashboard": (context) => const DashboardScreen(),
  "/profile": (context) => const ProfileScreen()
};
