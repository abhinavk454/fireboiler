import 'package:fireboiler/screens/dashboard_screen.dart';
import 'package:fireboiler/services/state_service.dart';
import 'package:fireboiler/utils/constant_utils.dart';
import 'package:fireboiler/widgets/button_one_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<ApplicationState>(context);

    return appState.user!.displayName == null
        ? Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
                left: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.network(
                        appState.user!.photoURL ?? placeholderLink,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: "Name",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  ButtonOne(
                    text: "Update Name",
                    height: 50.0,
                    width: 150.0,
                    bgColor: colorThree,
                    handleClick: () async {
                      await appState.updateName(_nameController.text);
                    },
                  ),
                ],
              ),
            ),
          )
        : DashboardScreen();
  }
}
