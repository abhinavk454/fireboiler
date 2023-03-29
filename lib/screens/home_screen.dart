import 'package:fireboiler/screens/dashboard_screen.dart';
import 'package:fireboiler/screens/profle_screen.dart';
import 'package:fireboiler/services/state_service.dart';
import 'package:fireboiler/widgets/button_one_widget.dart';
import 'package:flutter/material.dart';
import 'package:fireboiler/utils/constant_utils.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _emailInput = TextEditingController();
  final _passwordInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _screenWidth = MediaQuery.of(context).size.width;
    final appState = Provider.of<ApplicationState>(context);
    Logger logger = Logger();

    logger.d(appState.user);

    Widget getWidget() {
      if (appState.user != null && appState.user!.displayName != null) {
        return const DashboardScreen();
      } else if (appState.user != null && appState.user!.displayName == null) {
        return const ProfileScreen();
      } else {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Continue With App",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 20.0,
                      ),
                      child: TextFormField(
                        controller: _emailInput,
                        validator: (value) {
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                      child: TextFormField(
                        controller: _passwordInput,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60.0,
                ),
                ButtonOne(
                  text: "Continue",
                  height: 50.0,
                  width: 200.0,
                  bgColor: colorThree,
                  handleClick: () async {
                    await appState.signInWithEmailAndPassword(
                      _emailInput.text,
                      _passwordInput.text,
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: colorFour,
                      width: _screenWidth / 2.5,
                      height: 1,
                    ),
                    const Text('or'),
                    Container(
                      color: colorFour,
                      width: _screenWidth / 2.5,
                      height: 1,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ButtonOne(
                    text: "Continue With Google",
                    height: 50.0,
                    width: 200.0,
                    bgColor: colorOne,
                    handleClick: () async {
                      await appState.signInWithGoogle();
                    },
                    iconUrl: googleImageLink,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }

    return getWidget();
  }
}
